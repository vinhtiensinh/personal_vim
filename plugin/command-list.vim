if !has('ruby')
  finish
endif

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/command-list")
      require "#{path}/ruby/command-list/ruby_vim_extension.rb"
      require "#{path}/ruby/command-list/command-list.rb"
      require "#{path}/plugin/command-list.rb"
    end
  end
EOF
