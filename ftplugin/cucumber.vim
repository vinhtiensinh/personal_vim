" Vim filetype plugin
" Language:	Cucumber
" Maintainer:	Vinh Tran <qvinh.tran@gmail.coom>

if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1
hi Error guifg=Red gui=italic guibg=Black
silent! sign define fixme text=!! linehl=Error

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:# commentstring=#\ %s

if !has('ruby')
  finish
endif

setlocal omnifunc=CucumberComplete
autocmd BufWritePost,BufEnter <buffer> ruby VIMCucumber.check_steps_on_file
autocmd BufWritePost *.rb execute "ruby VIMCucumber.refresh('" . expand('%') . "')"

nmap <silent><buffer> <C-W><C-]>  :ruby VIMCucumber.jump_step('tabnew')<CR>

let b:undo_ftplugin = "setl fo< com< cms< ofu<"

let b:cucumber_root = expand('%:p:h:s?.*[\/]\%(features\|stories\)\zs[\/].*??')

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
