Cucumber.fetch_steps

class VIMCucumber
  def self.check_steps_on_file
    current_buffer = VIM::Buffer.current
    (1 .. current_buffer.length).each do |line_number|
      self.check_step_on_line line_number
    end
  end

  def self.check_step_on_line line_number=VIM::Buffer.current.line_number
    current_buffer = VIM::Buffer.current

    VIM::command(":sign unplace #{line_number}") if current_buffer[line_number].match(/^\s*$/)
    return unless Cucumber.is_a_step(current_buffer[line_number])

    string = self.normalise_step(current_buffer[line_number])

    if Cucumber.defined? string 
      VIM::command(":sign unplace #{line_number}")
    else
      VIM::command(":sign place #{line_number} line=#{line_number} name=fixme file=#{current_buffer.name}")
    end
  end

  def self.jump_step string=VIM::Buffer.current.line

    step = Cucumber.step_for self.normalise_step(string)
    if step.nil?
      VIM::command("echo 'step is nil'")
      self.check_step_on_line
    else
      VIM::command("tabnew #{step.file}")
      VIM::command("#{step.line_number}")
    end
  end

  def self.normalise_step line
    string = String.new(line)
    string.sub!(/^\s*\w+ /, '')
    string.sub!(/\s*$/,'')
    return string
  end

end
