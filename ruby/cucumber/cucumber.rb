#!/opt/local/bin/ruby

class Cucumber
  @@steps = {}
  def self.fetch_all_steps
    return unless File.exists? 'features/step_definitions'
    @@steps = {}

    self.fetch_steps 'features/step_definitions'
  end

  def self.fetch_steps dir_path='features/step_definitions'

    return unless dir_path.match('step_definitions')

    @@steps[dir_path] = [] if @@steps.has_key?(dir_path)

    rgrep_results = `egrep -rin '^\s*(Given|Then|When|And|But) ' #{dir_path}`
    rgrep_results = rgrep_results.split("\n")
    rgrep_results.each do | line |
      next if line =~ /\{/;
        self.add_step(Step.parse(dir_path, line))
    end
  end

  def self.add_step step
    @@steps[step.file] = [] unless @@steps.has_key?(step.file)
    @@steps[step.file].push(step)
  end

  def self.all_steps
    steps = []
    @@steps.each_pair do |file, file_steps|
      steps.push(file_steps)
    end

    return steps.flatten
  end

  def self.defined? string
    self.all_steps.each do |step|
      return true if step.match(string)
    end

    return false
  end

  def self.step_for string
    self.all_steps.each do |step|
      return step if step.match(string)
    end
    return nil
  end

  def self.is_a_step string
    return string.match(/^\s*(Given|And|When|Then|But)\s+/)
  end

  def self.find_steps_for string

    matched_steps = []
    words = string.downcase.split(' ')

    self.all_steps.each do |step|
      matched = true
      words.each do |word|
        unless step.has_word? word
          matched = false
          break
        end
      end

      if matched
        matched_steps.push(step)
      end
    end

    return matched_steps
  end
end

class Step
  attr_reader :regex, :file, :line_number, :variables, :type, :raw

  def self.parse dir_path, line
    parts = line.split(':')

    if parts[0].match(/\d+/)
      file        = dir_path
      line_number = parts.shift
      regex       = parts.join(':')
    else
      file        = parts.shift
      line_number = parts.shift
      regex       = parts.join(':')
    end

    if regex.match(/\|(.*?)\|\s*$/)
      variables = regex.match(/do\s+\|(.*?)\|\s*$/).captures.first.split(',')
      regex.gsub!(/do\s+\|(.*?)\|\s*$/, '')
    else
      variables = []
    end

    type = regex.match(/^\s*(\w+)\s/).captures.first
    regex.sub!(/^\s*\w+ /, '')
    regex.sub!(/^\s*\//, '')
    regex.sub!(/\/\s*(do\s*)?$/, '')

    return Step.new(
      :file        =>  File.expand_path(file),
      :line_number => line_number,
      :regex       => regex,
      :variables   => variables,
      :type        => type
    )
  end

  def initialize options
    begin
      @regex       = Regexp.new(options[:regex])
      @file        = options[:file]
      @line_number = options[:line_number]
      @variables   = options[:variables]
      @type        = options[:type]
      @raw         = options[:regex]
    rescue Exception => e
      puts e.message
    end
  end

  def match string
    return @regex.match string
  end

  def has_word? word
    return @raw.downcase.match(word)
  end

  def to_s
    line = String.new(@raw)

    line.gsub!('^', '')
    line.gsub!(/([^\\])\$/, '\1')
    line.gsub!(/([^\\])\(.*?[^\\]\)/, '\1<var>')

    vars = Array.new(@variables)
    while line.match('<var>') && vars.length > 0
      var = vars.shift
      var.gsub!(/^\s*/, '')
      var.gsub!(/\s*$/, '')
      line.sub!('<var>', "<#{var}>")
    end
    line.sub!(/\sdo(\s+\|.*)?$/, '')

    return line
  end
end
