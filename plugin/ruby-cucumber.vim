function! CucumberCheckLine()
  ruby VIMCucumber.check_step_on_line
endfunction

function! CucumberCheckFile()
  ruby VIMCucumber.check_steps_on_file
endfunction

function! CucumberJumpStep()
  ruby VIMCucumber.check_steps_on_file
endfunction

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/cucumber")
      require "#{path}/ruby/cucumber/cucumber.rb"
      require "#{path}/ruby/cucumber/vim-cucumber.rb"
    end
  end
EOF
