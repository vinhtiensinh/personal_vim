if !has('ruby')
  finish
end
 
ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/cucumber")
      require "#{path}/ruby/cucumber/cucumber.rb"
      require "#{path}/ruby/cucumber/vim-cucumber.rb"
      VIM::command("let g:vim_path = '#{path}'")
      break
    end
  end
EOF
