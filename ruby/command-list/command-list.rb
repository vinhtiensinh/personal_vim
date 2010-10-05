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
    VIM::command("split __Command-List__")
    VIM::Buffer.current.append(0, display_content)
    VIM::set_option('buftype=nofile')
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

    (1 .. 9).each do | line_number|
      VIM::command("map <buffer> #{line_number} #{line_number}G<CR>")
    end

    lists.each do | list |
      list.items.each do | item |
        VIM::command("map <buffer> #{item.map} :ruby CommandList::execute_shortcut('#{item.map}')<CR>")
      end
    end
  end

  def self.execute_shortcut(shortcut)
    command = self.get_selected_command_shortcut(shortcut)
    VIM::command("bd __Command-List__")
    command.execute unless command.nil?
  end

  def self.get_selected_command_shortcut(shortcut)
    @display_lists.each do | list |
      list.items.each do | item |
        return item if item.map == shortcut
      end
    end
  end

  def self.execute_function()
    command = self.get_selected_command()
    VIM::command("bd __Command-List__")
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
    menu  = options[:name]  || 'Miscellaneous'
    items = options[:items] || []

    items.each do | item |
      self.register_command(item.merge({:list => menu}))
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
    VIM::command("call feedkeys('gv')") if @visual_mode
    if @function.match('\(')
      VIM::command("call #{@function}")
    elsif @function.match(/^:/)
      if @visual_mode
        VIM::command("call feedkeys(':#{@function}')")
        VIM::command('call feedkeys("\<CR>")')
      else
        VIM::command(@function)
      end
    else
      VIM::command("call feedkeys(\"#{@function}\")")
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
    "---#{@name}---\n\t" + @items.join("\n\t")
  end
end

