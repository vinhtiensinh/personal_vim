function! CucumberCheckLine()
  ruby VIMCucumber.check_step_on_line
endfunction

function! CucumberCheckFile()
  ruby VIMCucumber.check_steps_on_file
endfunction

function! CucumberJumpStep()
  ruby VIMCucumber.jump_step
endfunction

function! CucumberComplete(findstart, base) abort
  let indent      = indent('.')
  let group       = synIDattr(synID(line('.'),indent+1,1),'name')
  let type        = matchstr(group,'\Ccucumber\zs\%(Given\|When\|Then\|And|But\)')
  let e           = matchend(getline('.'),'^\s*\S\+\s')
  if type == '' || col('.') < col('$') || e < 0
    return -1
  endif
  if a:findstart
    return e
  endif

  let sys_command = "ruby -e \"require '" . g:vim_path . "/ruby/cucumber/cucumber.rb'; require '" . g:vim_path . "/ruby/cucumber/vim-cucumber.rb'; Cucumber.fetch_steps; VIMCucumber.find_steps '" . a:base . "'\""
  let output      = system(sys_command)
  let steps       = split(output, "\n")
  return steps
endfunction

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/cucumber")
      require "#{path}/ruby/cucumber/cucumber.rb"
      require "#{path}/ruby/cucumber/vim-cucumber.rb"
      VIM::command("let g:vim_path = '#{path}'")
    end
  end
EOF
