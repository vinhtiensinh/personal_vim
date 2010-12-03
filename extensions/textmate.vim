set keymodel=startsel,stopsel
set selectmode=key,cmd,mouse

if (has('gui_macvim'))
  let mavim_hig_shift_movement = 1
endif

"save all
imap <M-D-S> <ESC>:wa<CR>
"select line
imap <D-L> <Home><S-End>
"select word
imap <C-w> <ESC>lbgh<S-C-Right>
"auto complete
"imap <ESC> <C-n>
" multiple search/replace should open the search box
imap <C-D-f> <D-f>


