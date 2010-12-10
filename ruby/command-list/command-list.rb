class CommandList
  @@lists = {}
  def self.display_command_list(*lists)

    @display_lists = []
    if lists.empty?
      @display_lists = @@lists.values
    else
      lists.each do | list_name |
        @display_lists.push(@@lists[list_name])
      end
    end

    display_content = @display_lists.join("\n")
    length = display_content.split("\n").length + 1

    VIM::command("#{length}split __Command-List__")
    VIM::Buffer.current.append(0, display_content)
    VIM::set_option('buftype=nofile')
    VIM::command('setlocal nobuflisted')
    self.syntax_on
 
    self.map_key @display_lists
  end

  def self.syntax_on
    [
      "syn region  menuHeader start='---' end='---'",
      'syn region  shortcut   start="\\["   end="\\]"',
      "hi def link menuHeader Constant",
      "hi def link shortcut   Statement"
    ].each do | command |
      VIM::command(command)
    end
  end

  def self.map_key lists
    VIM::command('map <buffer> <CR> :ruby CommandList::execute_function()<CR>')
    VIM::command('map <buffer> <ESC> :q!<CR>')
    VIM::command('map <buffer> q :q!<CR>')

    (1 .. 9).each do | line_number|
      VIM::command('map <buffer> #{line_number} #{line_number}G<CR>')
    end

    lists.each do | list |
      list.items.each do | item |
        VIM::command("map <buffer> #{item.map} :ruby CommandList::execute_function('#{item.map}')<CR>")
      end
    end
  end

  def self.get_command_shortcut(shortcut)
    @display_lists.each do | list |
      list.items.each do | item |
        return item if item.map == shortcut
      end
    end

    nil
  end

  def self.execute_list_item(list, shortcut)
    @@lists[list].items.each do | item |
      if item.map == shortcut
        item.execute
        return
      end
    end
  end


  def self.execute_function(shortcut=nil)

    if shortcut.nil?
      command = self.get_selected_command()
    else
      command = self.get_command_shortcut(shortcut)
    end

    VIM::command("bd")

    command.execute unless command.nil?
  end

  def self.get_selected_command()
    selected_line = VIM::Buffer.current.line
    selected_line.sub!(/^\s*/, '')
    selected_line.sub!(/\s*$/, '')

    @display_lists.each do | list |
      list.items.each do | item |
        item_line = item.to_s
        item_line.sub!(/^\s*/, '')
        item_line.sub!(/\s*$/, '')
        return item if item_line == selected_line
      end
    end
  end

  def self.register_command options
    menu = options.delete(:list) || 'Miscellaneous'
    @@lists[menu] = Menu.new(menu) unless @@lists.has_key?(menu)
    @@lists[menu].append(MenuItem.new(options))
  end

  def self.register_list options
    menu               = options[:name]  || 'Miscellaneous'
    items              = options[:items] || []
    map                = options[:map]
    map_item_with_list = options[:map_item_with_list]

    if (map)
      VIM::command("map #{map} :ruby CommandList::display_command_list('#{menu}')<CR>")
    end

    items.each do | item |
      self.register_command(item.merge({:list => menu}))

      if map_item_with_list
        VIM::command("map #{map}#{item[:map]} :ruby CommandList::execute_list_item('#{menu}', '#{item[:map]}')<CR>")
      end
    end
  end
end

class MenuItem
  attr_reader :function, :text, :map, :visual_mode
  def initialize options
    @function    = options[:function]
    @text        = options[:text]        || ''
    @map         = options[:map]         || ''
    @visual_mode = options[:visual_mode] || false
  end

  def to_s
    sprintf(@text)
  end

  def execute
    functions = [@function].flatten

    functions.each do | ifunction |
      VIM::command("call feedkeys('gv')") if @visual_mode
      if ifunction.match(/^:/)
        if @visual_mode
          VIM::command("call feedkeys(\":#{ifunction}\")")
          VIM::command('call feedkeys("\<CR>")')
        else
          VIM::command(ifunction)
        end
      elsif ifunction.match('\(')
        VIM::command("call #{ifunction}")
      else
        VIM::command("call feedkeys(\"#{ifunction}\")")
      end
    end
  end
end

class Menu
  attr_reader :items, :name

  def initialize name
    @name  = name
    @items = []
  end

  def append items
    @items.push(items)
  end

  def to_s
    "---#{@name}---\n\n\t#{ @items.join("\n\t") }"
  end
end

