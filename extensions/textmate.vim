
function! TextmateOn()

  set keymodel=startsel,stopsel
  set selectmode=key,cmd,mouse

  if (has('gui_macvim'))
    let mavim_hig_shift_movement = 1
  endif


  "save all
  imap <expr> <M-D-S> SaveAll()
  "auto complete
  imap <ESC> <C-n>

  "multiple search/replace should open the search box
  imap <C-D-f> <D-f>

  "select line
  imap <D-L> <Home><S-End>
  "select word
  imap <expr> <C-w> <C-o>b

  imap <expr> <C-ESC> TextmateOff()

endfunction

function! SaveAll()
  normal! wa
  return ""
endfunction

function! TextmateOff()

  set keymodel = ""
  set selectmode = ""
  silent! iunmap <M-D-S>
  silent! iunmap <D-L>
  silent! iunmap <C-w>
  silent! iunmap <C-D-f>
  silent! iunmap <ESC>
  silent! iunmap <C-S-Right>
  silent! vunmap <C-S-Right>
  silent! iunmap <C-S-Left>
  silent! vunmap <C-S-Left>
  echo "Textmate mode off"

  return ""
endfunction
