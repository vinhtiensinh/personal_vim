if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

imap <buffer> NN <ESC>rr/\|<CR>a<SPACE>
imap <buffer> <TAB> <C-N>
imap <buffer> dv <Down>
imap <buffer> df <Up>
imap <buffer> oo <ESC>:w<CR>rr
imap <buffer> vv <CR>
imap <buffer> cm <CR>--
map <buffer> ; :
imap <buffer> ; :
map <buffer> rr maggVG:!psvAlign.pl<CR>:w<CR>`a
map <buffer> sv  :so ../vpk_shortcut.vim<CR>
map <buffer> ff :tabnew <cword>.vpk <CR>
map <buffer> df gt 
map <buffer> fd gT
map <buffer> oo rr
map <buffer> cc <C-V>:!copyFirst.pl<CR>
map <buffer> cs ?\| <CR>v/\| <CR>  
map <buffer> cd c\| <ESC><ESC>       
map <buffer> v <C-V>
map <buffer> fo zmzo
map <buffer> fs zc
imap <buffer> hh \|
imap <buffer> JJ <ESC>kJJ
