if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

imap <buffer> cm <CR>--
imap <buffer> ; :
imap <buffer> hh \|
imap <buffer> JJ <ESC>kJJ
