Cucumber.fetch_all_steps

class VIMCucumber
  def self.check_steps_on_file
    current_buffer = VIM::Buffer.current
    (1 .. current_buffer.length).each do |line_number|
      self.check_step_on_line line_number
    end
  end

  def self.check_step_on_line line_number=VIM::Buffer.current.line_number
    current_buffer = VIM::Buffer.current

    unless Cucumber.is_a_step(current_buffer[line_number])
      VIM::command(":silent! sign unplace #{line_number}")
      return;
    end

    string = self.normalise_step(current_buffer[line_number])

    if Cucumber.defined? string 
      VIM::command(":silent! sign unplace #{line_number}")
    else
      VIM::command(":silent! sign place #{line_number} line=#{line_number} name=fixme file=#{current_buffer.name}")
    end
  end

  def self.find_steps string = VIM::Buffer.current.line
    string = self.normalise_step(string)
    steps = Cucumber.find_steps_for string
    steps_strings = []

    steps.each do |step|
      steps_strings.push(step.to_s)
    end


    puts steps_strings.join("\n")
  end

  def self.refresh file
    Cucumber.fetch_steps file
  end

  def self.jump_step command, string=VIM::Buffer.current.line

    step = Cucumber.step_for self.normalise_step(string)
    if step.nil?
      VIM::command("echo 'step is nil'")
      self.check_step_on_line
    else
      VIM::command("#{command} #{step.file}")
      VIM::command("#{step.line_number}")
    end
  end

  def self.normalise_step line
    string = String.new(line)
    string.sub!(/^\s*/, '')

    if string.match(/^(Given|Then|When|And|But)\s*/) 
      string.sub!(/^(Given|Then|When|And|But)\s*/, '') 
    end

    string.sub!(/\s*$/,'')
    return string
  end

end
