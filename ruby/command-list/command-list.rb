class CommandList
  @@lists = {}
  def self.display_command_list(*lists)

    display_lists = []

    if lists.empty?
      display_lists = @@lists.values
    else
      lists.each do | list_name |
        display_lists.push(@@lists[list_name])
      end
    end

    VIM::command('split __Command-List__')
    VIM::Buffer.current.append(0, display_lists.join("\n"))
    VIM::set_option('buftype=nofile')
    VIM::command('map <buffer> <CR> :call ExecuteFunction()<CR>')
  end

  def self.execute_function()
    function = VIM::Buffer.current.line.match(/\s(\w+)\s*$/).captures.first
    VIM::command("bd __Command-List__")
    if function.match('\(')
      VIM::command("call #{function}()")
    else
      VIM::command(function)
    end
  end

  def self.register (menu, function, text, description = '')
    menu = menu || 'Miscellaneous'
    @@lists[menu] = Menu.new(menu) unless @@lists.has_key?(menu)
    @@lists[menu].append(MenuItem.new(function, text, description))
  end
 end
class MenuItem
  attr_reader :function, :text, :description
  def initialize function, text, description
    @function    = function
    @text        = text
    @description = description
  end

  def to_s
    sprintf("%s ...  %s", @text, @function)
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
    "#{@name}\n\t" + @items.join("\n\t")
  end
end

