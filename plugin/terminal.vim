function! Terminal(icommand)
  let output = system('terminal.scpt ' . "'" . a:icommand . "'")
endfunction

function! Terminal_cd_dir(icommand)
  let output = system('terminal.scpt ' . "' cd " . getcwd() . ';' . a:icommand . "'")
endfunction
