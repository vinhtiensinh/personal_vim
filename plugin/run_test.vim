autocmd VimEnter *.feature,*.story map <LEADER>r :call RunSingleTest('bundle exec cucumber')<CR>
autocmd VimEnter *.feature,*.story map <LEADER>RR :call RunSingleTestFile('bundle exec cucumber')<CR>
autocmd VimEnter *.feature,*.story map <LEADER>R :call RunTests('bundle exec cucumber')<CR>

autocmd VimEnter *_spec.rb map <LEADER>r :call RunSingleTest('spec')<CR>
autocmd VimEnter *_spec.rb map <LEADER>RR :call RunSingleTestFile('spec')<CR>
autocmd VimEnter *_spec.rb map <LEADER>R :call RunTests('spec')<CR>
autocmd VimEnter *.t map <LEADER>r :call Terminal('testem')<CR>

function! Terminal(icommand)
  let output = system('terminal.scpt ' . "'" . a:icommand . "'")
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
  let test = input(a:icommand . '?: ', 'features/', 'file')

  if test == ''
    return
  elseif test =~ '^\s*\d\+\s*$'
    let test = expand('%') . ':'. test
  end

  call Terminal('cd ' . getcwd() . ';' . a:icommand . ' ' . test)

endfunction
