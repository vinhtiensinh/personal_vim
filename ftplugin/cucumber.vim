" Vim filetype plugin
" Language:	Cucumber
" Maintainer:	Vinh Tran <qvinh.tran@gmail.coom>

if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1
hi Error guifg=Red gui=italic guibg=Black
sign define fixme text=!! linehl=Error

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:# commentstring=#\ %s
setlocal omnifunc=CucumberComplete
autocmd BufWritePost,BufEnter <buffer> ruby VIMCucumber.check_steps_on_file
autocmd BufWritePost *.rb ruby VIMCucumber.refresh

nmap <silent><buffer> <C-W><C-]>  :ruby VIMCucumber.jump_step<CR>

let b:undo_ftplugin = "setl fo< com< cms< ofu<"

let b:cucumber_root = expand('%:p:h:s?.*[\/]\%(features\|stories\)\zs[\/].*??')
