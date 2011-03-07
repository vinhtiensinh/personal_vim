function! Safari(icommand)
  let output = system('osascript ~/.vim/scripts/safari.scpt ' . "'" . a:icommand . "'")
endfunction
