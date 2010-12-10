let g:screen_line_jumper_skip = 1

function! MoveLineNumberEndWith(number)
  let current_line = getpos('.')[1]
  let start_line = getpos('w0')[1]
  let end_line = getpos('w$')[1]

  let line_number = current_line + g:screen_line_jumper_skip
  while line_number <= end_line
    if line_number % 10 == a:number
      call feedkeys(line_number . 'G')
      return
    else
      let line_number = line_number + 1
    endif
  endwhile

  let line_number = start_line
  while line_number <= current_line
    if line_number % 10 == a:number
      call feedkeys(line_number . 'G')
      return
    else
      let line_number = line_number + 1
    endif
  endwhile
endfunction

function! MoveLineNumberEndWithBackward(number)
  echo "Hello World"
  let current_line = getpos('.')[1]
  let start_line = getpos('w0')[1]
  let end_line = getpos('w$')[1]

  let line_number = current_line - g:screen_line_jumper_skip
  while line_number >= start_line
    if line_number % 10 == a:number
      call feedkeys(line_number . 'G')
      return
    else
      let line_number = line_number - 1
    endif
  endwhile

  let line_number = end_line
  while line_number >= current_line
    if line_number % 10 == a:number
      call feedkeys(line_number . 'G')
      return
    else
      let line_number = line_number - 1
    endif
  endwhile
endfunction

map <D-0> :call MoveLineNumberEndWith(0)<CR>
map <D-1> :call MoveLineNumberEndWith(1)<CR>
map <D-2> :call MoveLineNumberEndWith(2)<CR>
map <D-3> :call MoveLineNumberEndWith(3)<CR>
map <D-4> :call MoveLineNumberEndWith(4)<CR>
map <D-5> :call MoveLineNumberEndWith(5)<CR>
map <D-6> :call MoveLineNumberEndWith(6)<CR>
map <D-7> :call MoveLineNumberEndWith(7)<CR>
map <D-8> :call MoveLineNumberEndWith(8)<CR>
map <D-9> :call MoveLineNumberEndWith(9)<CR>

"map <D-)> :call MoveLineNumberEndWithBackward(0)<CR>
"map <D-!> :call MoveLineNumberEndWithBackward(1)<CR>
"map <D-@> :call MoveLineNumberEndWithBackward(2)<CR>
"map <D-#> :call MoveLineNumberEndWithBackward(3)<CR>
"map <D-$> :call MoveLineNumberEndWithBackward(4)<CR>
"map <D-%> :call MoveLineNumberEndWithBackward(5)<CR>
"map <D-^> :call MoveLineNumberEndWithBackward(6)<CR>
"map <D-&> :call MoveLineNumberEndWithBackward(7)<CR>
"map <D-*> :call MoveLineNumberEndWithBackward(8)<CR>
"map <D-(> :call MoveLineNumberEndWithBackward(9)<CR>
