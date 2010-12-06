class SmartJumper

  @@jumbers = []

  def self.jump command, string=nil
    jumper = self.get_jumper
    
    if jumper.nil?
      VIM::command("echo 'No jumber find'")
    else
      file_path = jumper.jump string
    end

    VIM::command("#{command} #{file_path}")

  end

  def self.jump_with id, string
    jumper = self.get_jumper_with_id(id)
    
    if jumper.nil?
      VIM::command("echo 'No jumber with id #{id} found'")
    else
      jumper.jump string
    end

  end

  def self.get_jumper
    @@jumbers.each do | jumper |
      return jumper if jumper.match
    end
  end

  def self.register_jumper jumper
    @@jumbers.push(jumper)
  end
end

class PerlJumper
  
  attr_reader :paths, :files, :id

  def initialize options
    @paths = options[:paths]
    @files = options[:files].split(',')
    @id    = options[:id]
  end

  def match
    buffer_name = VIM::Buffer.current.name
    @files.each do | file |
      return true if buffer_name.match(file)
    end

    return false

  end

  def jump string
    string = string || VIM::evaluate("expand('<cword>')")

    file_path = string.gsub!('::', '/')
    file_path.sub!(/\s*$/, '.pm')

    @paths.each do | path |
      if File.exists?(path + file_path)
        return path + file_path
      end
    end

    return nil

  end
end
