class VIM::Buffer
  alias :__append :append
  def append lineNo, lines
    if lines.class == Array
      lines.each_index do | index |
        __append(lineNo + index, lines[index])
      end
    else
      lines = lines.split("\n")
      append(lineNo, lines)
    end
  end
end

module VIM
  def self.register_vim_command name, function
    VIM::command("
      function! #{name}()
        ruby #{function}() 
      endfunction
    ");
  end
end
