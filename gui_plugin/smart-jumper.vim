if !has('ruby')
  finish
endif

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/smart-jumper")
      require "#{path}/ruby/smart-jumper/smart_jumper.rb"
      require "#{path}/gui_plugin/smart-jumper.rb"
    end
  end
EOF
