if (exists("b:did_ftplugin"))
  finish
endif

let b:did_ftplugin=1

setlocal comments=:#
setlocal commentstring=#\ %s

if expand('%:p') =~ '\.yaml\.vpk'
  map <buffer> g<Space> :call JumpVPokerYaml(':e')<CR>
  map <buffer> g<S-Space> :call JumpVPokerYaml(':split')<CR>
  map <buffer> g<S-Space><S-Space> :call JumpVPokerYaml(':vsplit')<CR>
else
  imap <buffer> hh \|
  map <buffer> g<Space> :call JumpVPoker(':e')<CR>
  map <buffer> g<S-Space> :call JumpVPoker(':split')<CR>
  map <buffer> g<S-Space><S-Space> :call JumpVPoker(':vsplit')<CR>
endif

if expand('%:p') =~ '\.yaml\.vpk'
  setlocal foldmethod=expr
  setlocal foldexpr=(getline(v:lnum)=~'^$')?-1:((indent(v:lnum)<indent(v:lnum+1))?('>'.indent(v:lnum+1)):indent(v:lnum))
  setlocal foldtext=getline(v:foldstart)
  setlocal fillchars=fold:\ "(there's a space after that \)
  highlight Folded ctermfg=DarkGreen ctermbg=Black

  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal tabstop=4
else
  setlocal foldmethod=marker
  setlocal foldmarker=[,]
  setlocal foldtext=VPKFoldText()
  setlocal fillchars=fold:\ "(there's a space after that \)
  highlight Folded ctermfg=White ctermbg=Black guibg=grey6
endif

normal! zR

if exists("g:did_vpoker_ftplugin_functions")
  finish
endif
let g:did_vpoker_ftplugin_functions = 1

function! VPKFoldText()
  let line = getline(v:foldstart)
  return line . " ... ]" 
endfunction


function! JumpVPoker(open)

  let action = substitute(getline('.'), '\n', '', '')

  if action =~ '\['
    normal "0yi[
    let action = getreg(0)
  endif

  let action = substitute(action, '#.*', '', '')
  let action = substitute(action, '^\s*', '', '')
  let action = substitute(action, ',\s*$', '', '')
  let action = substitute(action, '^\s*', '', '')
  let action = substitute(action, '\s\s*', ' ', 'g')

  if action =~ '\~'
    let action = substitute(action, '\~', '', '')
    silent call feedkeys('gg0')
    silent call feedkeys('/@'.action."\<CR>")
    return
  endif


  let parts = split(action, '\.')
  let ifile = parts[0]
  let action = parts[1]

  let current_file = expand('%')
  let strategy = matchstr(current_file, 'formulas/\(.*\)/')
  let strategy = split(strategy, '/')[1]
  let ifile =  '/Users/vinhtiensinh/repos/vpoker/formulas/'.strategy.'/'.ifile.'.vpk'
  execute a:open ." " . ifile
  silent call feedkeys('gg0')
  silent call feedkeys('/@'.action."\<CR>")
endfunction

function JumpVPokerYaml(open)
  let action = substitute(getline('.'), '\n', '', '')
  if action =~ '\['
    normal "0yi[
    let action = getreg(0)
  endif
  let action = substitute(action, '#.*', '', '')
  let action = substitute(action, '^\s*-', '', '')
  let action = substitute(action, '^.*:', '', '')
  let action = substitute(action, ',\s*$', '', '')
  let action = substitute(action, '^\s*', '', '')
  let action = substitute(action, '\s\s*', ' ', 'g')

  if action =~ '\~'
    let action = substitute(action, '\~', '', '')
    silent call feedkeys('G')
    silent call feedkeys('?'.action . ':'."\<CR>")
    return
  elseif action =~ '\*'
    let action = substitute(action, '\*', '\&', '')
    silent call feedkeys('gg')
    silent call feedkeys('/'.action."\<CR>")
  endif
endfunction
