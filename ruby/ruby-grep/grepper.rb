class Grepper
  def self.grep string, path, options
    result = `grep -#{options.join('')} #{string} #{path} `
    @@current_match = MatchResult.new(result)
    self.display(string, @@current_match)
  end

  def self.display string, match_result
    VIM::command('tabnew __grep__')
    VIM::Buffer.current.append(0, self.prepare(match_result))
    VIM::set_option('buftype=nofile')
    VIM::command("match Constant '#{string}'")
    self.syntax_on
  end

  def self.prepare match_result
    text = ''

    match_result.result.each_pair do | key, value |
      if (value.length > 1 )
        text = text +  "#{key}: (#{value.length}) {{{\n"
        value.each do | match |
          text = text + "    #{match.file}:#{match.line_number} #{match.line}\n"
        end
        text = text +  "}}}\n"
      else
        match = value[0]
        text = text + "#{match.file}:#{match.line_number} #{match.line}\n"
      end
    end

    return text
  end

  def self.syntax_on
    [
      "setlocal foldmethod=marker",
      "set fillchars=fold:\\ ",
      "set foldtext=substitute(getline(v:foldstart),'{{{','+','g')",
      "highlight Folded ctermfg=White ctermbg=Black guifg=White guibg=Black",
    ].each do | command |
      VIM::command(command)
    end
  end
end

class MatchResult
  attr_reader :result
  def initialize raw_result
    @result = {}
    raw_result.split("\n").each do |match|
      self.add(Match.parse(match))
    end
  end

  def add match
      if @result.has_key?(match.file)
        @result[match.file].push(match)
      else
        @result[match.file] = [ match ]
      end
  end
end

class Match
  attr_reader :file, :line, :line_number

  def initialize options
    @file = options[:file]
    @line_number = options[:line_number]
    @line = options[:line]
  end

  def self.parse string
    parts = string.split(':')
    return Match.new(
      :file => parts.shift,
      :line_number => parts.shift,
      :line => parts.join()
    )
  end
end
