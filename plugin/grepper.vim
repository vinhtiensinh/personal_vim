ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/ruby-grep")
      require "#{path}/ruby/ruby-grep/grepper.rb"
    end
  end
EOF
