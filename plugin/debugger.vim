hi BreakPoint guifg=DarkRed ctermfg=DarkRed guibg=LightGrey ctermbg=LightGrey
silent! sign define breakpoint linehl=BreakPoint

autocmd BufEnter *.rb map <LEADER>0 :call AddBreakPoint('require "ruby-debug"; debugger')<CR>
autocmd BufEnter,BufWritePost *.rb call RedrawBreakPoints('require "ruby-debug"; debugger')
autocmd BufEnter *.feature,*.story map <LEADER>0 :call AddBreakPoint('And we debug')<CR>
autocmd BufEnter,BufWritePost *.feature,*.story call RedrawBreakPoints('And we debug')

autocmd BufEnter *.pm,*.pl,*.t map <LEADER>0 :call AddBreakPoint('use XXX; XXX::DUMPER()')<CR>
autocmd BufEnter *.pm,*.pl,*.t map <LEADER>) :call AddBreakPoint('use Data::Dumper; print Dumper()')<CR>
autocmd BufEnter,BufWritePost *.feature,*.story call RedrawBreakPoints('use XXX; XXX::DUMER()')


function! AddBreakPoint(debugCode)
  call append(line('.'), a:debugCode)
  call RedrawBreakPoints(a:debugCode)
endfunction

function! RedrawBreakPoints(debugCode)
  if has('signs')
    let signIDStart = 1000000
    let iend = line('$')
    let index = 1

    while index <= iend
      let signID = index + signIDStart
      let file_name   = expand('%')
      if getline(index) =~ a:debugCode
        execute 'sign place ' . signID . ' line=' . index .  ' name=breakpoint file=' . file_name
      else
        execute 'sign unplace ' . signID
      endif

      let index = index + 1
    endwhile
  endif
endfunction
