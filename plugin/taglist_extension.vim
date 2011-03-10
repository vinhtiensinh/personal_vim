let inumber = 0
while inumber < 100
  execute "map  " . inumber . "m " . ":call GotoMethod(" . inumber . ")<CR>"
  let inumber = inumber + 1
endwhile

function! GotoMethod(line_number)
  let winNum = FindWindow('__Tag_List__')
  exec l:winNum.' wincmd w'
  call feedkeys(a:line_number."G")
  call feedkeys("\<CR>")
endfunction
