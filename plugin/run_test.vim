autocmd VimEnter *.feature,*.story map <LEADER>t :call RunSingleTest('cucumber')<CR>
autocmd VimEnter *.feature,*.story map <LEADER>T :call RunSingleTestFile('cucumber')<CR>
autocmd VimEnter *.feature,*.story map <LEADER>tt :call RunTests('cucumber')<CR>

autocmd VimEnter *_spec.rb map <LEADER>t :call RunSingleTest('spec')<CR>
autocmd VimEnter *_spec.rb map <LEADER>T :call RunSingleTestFile('spec')<CR>
autocmd VimEnter *_spec.rb map <LEADER>tt :call RunTests('spec')<CR>
autocmd VimEnter *.t map <LEADER>t :call Terminal('testem')<CR>

function! Terminal(icommand)
  execute system('terminal.scpt ' . "'" . a:icommand . "'")
endfunction

function! RunSingleTest(icommand)
  let test = expand('%') . ':'. line('.')
  call Terminal('cd ' . getcwd() . ';' . a:icommand . ' ' . test)
endfunction

function! RunSingleTestFile(icommand)
  let test = expand('%')
  call Terminal('cd ' . getcwd() . ';' . a:icommand . ' ' . test)
endfunction

function! RunTests(icommand)
  let test = input(a:icommand . '?: ')
  call Terminal('cd ' . getcwd() . ';' . a:icommand . ' ' . test)
endfunction
