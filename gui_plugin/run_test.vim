autocmd BufNewFile,BufReadPost *.feature,*.story map <D-r> :call RunSingleTest('bundle exec cucumber')<CR>
autocmd BufNewFile,BufReadPost *.feature,*.story map <D-R> :call RunSingleTestFile('bundle exec cucumber')<CR>
autocmd BufNewFile,BufReadPost *.feature,*.story map <LEADER>r :call RunTests('bundle exec cucumber')<CR>

autocmd BufNewFile,BufReadPost *_spec.rb map <D-r> :call RunSingleTest('bundle exec rspec')<CR>
autocmd BufNewFile,BufReadPost *_spec.rb map <D-R> :call RunSingleTestFile('bundle exec rspec')<CR>
autocmd BufNewFile,BufReadPost *_spec.rb map <LEADER>r :call RunTests('bundle exec rspec')<CR>

autocmd BufNewFile,BufReadPost *.t map <D-r> :call RunSingleTestFile('perl')<CR>
autocmd BufNewFile,BufReadPost *.t map <LEADER>r :call Terminal('testem')<CR>

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
