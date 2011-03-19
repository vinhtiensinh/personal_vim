class Selector
  def self.map
    ',:.=/_'.split('').each do |seperator|
      VIM::command("vmap a#{seperator} :ruby Selector.select(:char => '#{seperator}')<CR>")
      VIM::command("vmap i#{seperator} :ruby Selector.select(:char => '#{seperator}',:end_char => '#{seperator}', :inner => true)<CR>")
      VIM::command("omap a#{seperator} :normal va#{seperator}<CR>")
      VIM::command("omap i#{seperator} :normal vi#{seperator}<CR>")
    end

    VIM::command("vmap a\\| :ruby Selector.select(:char => '\\|')<CR>")
    VIM::command("vmap i\\| :ruby Selector.select(:char => '\\|',:end_char => '\\|', :inner => true)<CR>")
    VIM::command("omap a\\| :normal va\\|<CR>")
    VIM::command("omap i\\| :normal vi\\|<CR>")

    VIM::command("xmap <Space>; :ruby Selector.select_forward<CR>")
    VIM::command("xmap <Space>, :ruby Selector.select_backward<CR>")

  end

  def self.select attr
    char     = attr[:char]
    inner    = attr[:inner]
    end_char = attr[:end_char]

    if (char.match(/[()\[\]{}<>]/))
      @action = SelectBracesAction.new(char, inner)
    else
      @action = SelectPairAction.new(char, end_char, inner)
    end

    @action.select
  end

  def self.select_forward
    @action = @action.next
    @action.select
  end

  def self.select_backward
    @action = @action.previous
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

  def next
    VIM::command('call feedkeys("\<ESC>")')
    VIM::command("call feedkeys('f#{@char}')")
    return SelectBracesAction.new(@char, @inner)
  end

  def previous
    VIM::command('call feedkeys("\<ESC>")')
    VIM::command("call feedkeys('F#{@char}')")
    return SelectBracesAction.new(@char, @inner)
  end
end

class SelectPairAction
  attr_reader :char, :end_char, :inner, :beginIndex

  def initialize char, end_char, inner=false, beginIndex=VIM::evaluate("col('.')")
    @char       = char
    @end_char   = end_char || char
    @inner      = inner
    @beginIndex = beginIndex
  end

  def select
    line = VIM::Buffer.current.line

    beginIndex = @beginIndex
    while beginIndex > 1
      if line[beginIndex - 1].chr == @char
        break
      end
      beginIndex = beginIndex - 1
    end
    beginIndex = beginIndex + 1 if line[beginIndex - 1].chr == @char && @inner
    @beginIndex = beginIndex

    endIndex = beginIndex + 1
    while endIndex < line.length
      if line[endIndex - 1].chr == @end_char
        break
      end
      endIndex = endIndex + 1
    end
    endIndex = endIndex - 1 if endIndex <= line.length && line[endIndex - 1].chr == @end_char && @inner
    @endIndex = endIndex

    VIM::command("call feedkeys('#{@beginIndex}|v#{@endIndex}|')")
  end

  def next
    if @inner
      return SelectPairAction.new(@char, @end_char, @inner, @endIndex + 1)
    else
      return SelectPairAction.new(@char, @end_char, @inner, @endIndex)
    end
  end

  def previous
    if @inner
      return SelectPairAction.new(@char, @end_char, @inner, @beginIndex - 2)
    else
      return SelectPairAction.new(@char, @end_char, @inner, @beginIndex - 1)
    end
  end
end
