vmap il :call SelectLeft('i')<CR>
vmap al :call SelectLeft('a')<CR>
vmap ir :call SelectRight('i')<CR>
vmap ar :call SelectRight('a')<CR>

omap il :normal vil<CR>
omap al :normal val<CR>
omap ir :normal vir<CR>
omap ar :normal var<CR>

function! SelectLeft(inner_or_all)
  let iStart = FindEqualSign()
  if a:inner_or_all == 'i'
    let iStart = iStart - 1
  endif
  call feedkeys(iStart.'|v^')
endfunction

function! SelectRight(inner_or_all)
  let iStart = FindEqualSign()

  if a:inner_or_all == 'i'
    let nextChar = getline('.')[iStart + 2]

    if (nextChar == '>' || nextChar == '==')
      let iStart = iStart + 3
    else
      let iStart = iStart + 2
    endif
  endif

  if a:inner_or_all == 'i'
    call feedkeys(iStart.'|v$h')
  else
    call feedkeys(iStart.'|v$')
  endif
endfunction

function! FindEqualSign()
  let line = getline('.')
  let i = 0 

  while i >= 0
    if (line[i] == '=') || (line[i] == '-' && line[i + 1] == '>')
      return i + 1
    endif

    let i = i + 1
  endwhile
endfunction
