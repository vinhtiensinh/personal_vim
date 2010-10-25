if !has('ruby')
  finish
endif

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
  let matches += [['.', '.']]

  for imatch in matches
    execute 'map <LEADER>f' . imatch[0] . ' f' . imatch[0] . 'vf' . imatch[1]
    execute 'xmap <LEADER>f' . imatch[0] . ' <ESC>f' . imatch[0] . 'vf' . imatch[1]
    execute 'map <LEADER>F' . imatch[0] . ' F' . imatch[0] . ';' . 'vf' . imatch[1]
    execute 'xmap <LEADER>F' . imatch[0] . ' <ESC>F' . imatch[0] . ';' . 'vf' . imatch[1]
    execute 'map <LEADER>t' . imatch[0] . ' f' . imatch[0] . 'lvt' . imatch[1]
    execute 'xmap <LEADER>t' . imatch[0] . ' <ESC>f' . imatch[0] . 'lvt' . imatch[1]
    execute 'map <LEADER>T' . imatch[0] . ' F' . imatch[0] . 'lvt' . imatch[1]
    execute 'xmap <LEADER>T' . imatch[0] . ' <ESC>F' . imatch[0] . 'lvt' . imatch[1]

    if (imatch[0] == imatch[1])
      execute 'nmap <LEADER>ff' . imatch[0] . ' f' . imatch[0] . 'l' . 'vt' . imatch[1]
      execute 'xmap <LEADER>ff' . imatch[0] . ' <ESC><LEADER>ff' . imatch[0]
      execute 'map <LEADER>F' . '' . imatch[0] . ' f' . imatch[0] . 'l' . 'vf' . imatch[1]
      execute 'xmap <LEADER>F' . '' . imatch[0] . ' <ESC>f' . imatch[0] . 'l' . 'vf' . imatch[1]
    else
      execute 'map <LEADER>f' . imatch[1] . ' f' . imatch[0] . 'l'. 'vf' . imatch[1]
      execute 'map <LEADER>t' . imatch[1] . ' f' . imatch[1] . 'hvT' . imatch[0]
    endif
  endfor
endfunction

autocmd BufEnter * call MapSelectMatches()
nnoremap  <LEADER>y :<C-U>call CopyLineNumber()<CR>
map  <LEADER>w :call CopyLines()<CR>
imap <S-Tab> <ESC>ncw
