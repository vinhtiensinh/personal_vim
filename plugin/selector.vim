rubyf /Users/vinh_tran/vim-lab/text_queue.rb

function! CopyLineNumber() range
  call feedkeys(v:count . "Gyy\<C-o>")
  echo "copied: " . getline(v:count)
endfunction

function! CopyLines()
  let iline = input("Line Number: ")

  if iline =~ ' '
    let parts = split(iline, ' ')
    call feedkeys(parts[0] . "G" . (parts[1] - parts[0] + 1) . "yy\<C-o>")
  else
    call feedkeys(iline . "Gyy\<C-o>")
    echo "copied: " . getline(iline)
  endif

endfunction

function! MapSelectMatches()
  let matches = []
  let matches += [["'", "'"]]
  let matches += [['"', '"']]
  let matches += [['(', ')']]
  let matches += [['{', '}']]
  let matches += [['[', ']']]
  let matches += [[':', ':']]
  let matches += [['=', '=']]
  let matches += [['<', '>']]
  let matches += [['\|', '\|']]

  for imatch in matches
    execute 'map <LEADER>s' . imatch[0] . ' T' . imatch[0] . 'vt' . imatch[1] 
    execute 'map <LEADER>S' . imatch[0] . ' F' . imatch[0] . 'vf' . imatch[1] 
  endfor
endfunction

autocmd BufEnter * call MapSelectMatches()
nnoremap  <LEADER>y :<C-U>call CopyLineNumber()<CR>
map  <LEADER>w :call CopyLines()<CR>
