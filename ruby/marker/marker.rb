class Marker
  def self.open
    marks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWZYZ'
    markArray = []

    marks.split('').each do | char |
      values = VIM::evaluate("getpos(\"'" + char + '")')
      mark =Mark.new(char, values)
      markArray.push(mark) if mark.number == 0 && mark.line > 0
    end

    content = markArray.join("\n\n")
    filetype = VIM::evaluate('&filetype')
    VIM::command('split __marks__')
    VIM::Buffer.current.append(0, content)
    VIM::set_option('buftype=nofile')
    VIM::command('setlocal nobuflisted')

    VIM::command("set filetype=#{filetype}")

    self.syntax_on
    self.map_on markArray
  end

  def self.map_on marks
    VIM::command('map <buffer> <ESC> :q!<CR>')
    marks.each do |mark|
      VIM::command("map <buffer> #{mark.id} <ESC>'#{mark.id}")
    end
  end

  def self.syntax_on
    [
      "syn match markId '^\\[.\\]$'",
      "hi def link markId Type",
    ].each do | command |
      VIM::command(command)
    end
  end
end

class Mark
  attr_reader :col, :line, :id, :number

  def initialize id, values
    @id = id
    @number = values.shift
    @line = values.shift
    @col = values.shift
  end

  def to_s
    context = []
    context.push("[#{@id}]")
    context.push(VIM::Buffer[@number][@line - 1]) if @line > 1
    context.push(VIM::Buffer[@number][@line])
    context.push(VIM::Buffer[@number][@line + 1]) if VIM::Buffer[@number].count > @line
    return context.join("\n")
  end
end
