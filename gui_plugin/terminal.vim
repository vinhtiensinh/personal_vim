function! Terminal(icommand)
  let output = system('osascript ~/.vim/scripts/terminal.scpt ' . "'" . a:icommand . "'")
endfunction

function! Terminal_cd_dir(icommand)
  let output = system('osascript ~/.vim/scripts/terminal.scpt ' . "' cd " . getcwd() . ';' . a:icommand . "'")
endfunction
