function! GotoBuffer(index)
  b -MiniBufExplorer-
  call feedkeys(a:index . "G")
  call feedkeys("\<CR>")
endfunction
