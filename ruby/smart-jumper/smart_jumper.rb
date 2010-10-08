class SmartJumper
  def self.jump string
    get_jumper.jump string
  end

  def self.get_jumper
    PerlJumper.new(:paths => ['/Users/vinh_tran/branches/librea/lib/'])
  end

  def self.register_jumper options
  end
end

class PerlJumper
  
  attr_reader :paths

  def initialize options
    @paths = options[:paths]
  end

  def jump string
    file_path = string.gsub!('::', '/')
    file_path.sub!(/\s*$/, '.pm')

    @paths.each do | path |
      if File.exists?(path + file_path)
        file_path = path + file_path
        break
      end
    end

    VIM::command("tabnew #{file_path}")
  end
end
