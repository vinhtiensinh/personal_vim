" Vim filetype plugin
" Language:	Cucumber
" Maintainer:	Vinh Tran <qvinh.tran@gmail.coom>

if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1
hi Error guifg=Red gui=italic guibg=Black ctermfg=Red ctermbg=Black
silent! sign define fixme text=>> texthl=Error

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:# commentstring=#\ %s

if !has('ruby') || !has('gui')
  finish
endif

setlocal omnifunc=CucumberComplete
autocmd BufWritePost <buffer> ruby VIMCucumber.check_steps_on_file
autocmd BufWritePost step_definitions/**/*.rb execute "ruby VIMCucumber.refresh('" . expand('%') . "')"

nmap <silent><buffer> g<C-]> :ruby VIMCucumber.jump_step('e')<CR>
"nmap <silent><buffer> g} :ruby VIMCucumber.jump_step('vsplit')<CR>
"nmap <silent><buffer> g} :ruby VIMCucumber.jump_step('split')<CR>

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

ruby VIMCucumber.check_steps_on_file
