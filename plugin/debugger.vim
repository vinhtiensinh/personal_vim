hi BreakPoint guifg=DarkRed ctermfg=DarkRed guibg=LightGrey ctermbg=LightGrey
silent! sign define breakpoint text=* linehl=BreakPoint

autocmd BufEnter *.rb map <LEADER>x :call ToggleBreakPoint('require "ruby-debug"; debugger')<CR>
autocmd BufEnter *.feature,*.story map <LEADER>x :call ToggleBreakPoint('And we debug')<CR>

autocmd BufEnter *.pm,*.pl,*.t map <LEADER>x :call ToggleBreakPoint('use XXX; XXX::DUMPER()')<CR>
autocmd BufEnter *.pm,*.pl,*.t map <LEADER>X :call ToggleBreakPoint('use Data::Dumper; print Dumper()')<CR>


function! ToggleBreakPoint(debugCode)
  let line_number = line('.') + 1
  let file_name = expand('%')

  if getline('.') =~ a:debugCode
    execute 'sign unplace ' . line('.')
    call feedkeys('dd')
  else
    call append(line('.'), a:debugCode)
    execute 'sign place ' . line_number . ' line=' . line_number .  ' name=breakpoint file=' . file_name
  endif
endfunction
