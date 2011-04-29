for letter in ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  execute 'map <Space>m'.letter. ' :call JumpMethod("'.letter.'")<CR>'
endfor

function! JumpMethod(letter)
  echo 'Jumpmethod'
  execute ':TlistOpen'
  call feedkeys('/^\s*'.a:letter."\<CR>")
endfunction
