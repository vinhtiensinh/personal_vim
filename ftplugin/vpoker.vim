if (exists("b:did_ftplugin"))
  finish
endif

let b:did_ftplugin=1

imap <buffer> cm <CR>--
imap <buffer> ; :
imap <buffer> hh \|
imap <buffer> JJ <ESC>kJJ
map <buffer> g<Space> :call JumpVPoker()<CR>


if exists("g:did_vpoker_ftplugin_functions")
  finish
endif
let g:did_vpoker_ftplugin_functions = 1

function! JumpVPoker()
  normal "0yi[
  let action = getreg(0)

  if action =~ '\~'
    let action = substitute(action, '\~', '', '')
    silent call feedkeys('gg0')
    silent call feedkeys('/@'.action."\<CR>")
    normal! zo
    return
  endif


  let parts = split(action, '\.')
  let ifile = parts[0]
  let action = parts[1]

  let current_file = expand('%')
  let strategy = matchstr(current_file, 'formulas/\(.*\)/')
  let strategy = split(strategy, '/')[1]
  let ifile =  '/Users/vinhtiensinh/repos/vpoker/formulas/'.strategy.'/'.ifile.'.vpk'
  execute ":e " . ifile
  silent call feedkeys('gg0')
  silent call feedkeys('/@'.action."\<CR>")
  normal! zo
endfunction
