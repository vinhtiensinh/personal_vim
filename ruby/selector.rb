class Selector
  def self.select char, inner=false
    if (char.match(/[()\[\]{}]/))
      @action = SelectBracesAction.new(char, inner)
    else
      @action = SelectAction.new(char, inner)
    end

    @action.select
  end
end

class SelectBracesAction
  attr_reader :char, :inner
  def initialize char, inner=false
    @char  = char
    @inner = inner
  end

  def select
    if @inner
      VIM::command("call feedkeys('vi#{@char}')")
    else
      VIM::command("call feedkeys('va#{@char}')")
    end
  end
end

class SelectAction
  attr_reader :char, :inner

  def initialize char, inner=false
    @char  = char
    @inner = inner
  end

  def select
    column = VIM::evaluate("col('.')")
    line = VIM::Buffer.current.line

    beginIndex = column
    while beginIndex > 0
      if line[beginIndex - 1].chr == @char
        break
      end
      beginIndex = beginIndex - 1
    end
    beginIndex = beginIndex + 1 if line[beginIndex - 1].chr == @char && @inner

    endIndex = column
    while endIndex < VIM::evaluate("col('$')") - 1
      if line[endIndex - 1].chr == @char
        break
      end
      endIndex = endIndex + 1
    end
    endIndex = endIndex - 1 if line[endIndex - 1].chr == @char && @inner

    VIM::command("call feedkeys('#{beginIndex}|v#{endIndex}|')")
  end

  def select_forward char

  end

  def select_backward char

  end
end
