function! OpenNextPage()
  vsplit
  call feedkeys("<C-f>")
endfunction

function! ScrollNextPageWithH()
  let current_line = getpos('.')[1]
  let start_line = getpos('w0')[1]

  if current_line > start_line
    normal! H
  else
    call feedkeys("\<C-b>H")
  endif
endfunction

function! ScrollPreviousPageWithL()
  let current_line = getpos('.')[1]
  let end_line = getpos('w$')[1]

  if current_line < end_line
    normal! L
  else
    call feedkeys("\<C-f>L")
  endif
endfunction

function! ScrollPreviousPageWithL()
  let current_line = getpos('.')[1]
  let end_line = getpos('w$')[1]

  if current_line < end_line
    normal! L
  else
    call feedkeys("\<C-f>L")
  endif
endfunction

map H :call ScrollNextPageWithH()<CR>
map L :call ScrollPreviousPageWithL()<CR>
map <M-f> :call OpenNextPage()<CR>
