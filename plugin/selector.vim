if !has('ruby')
  finish
endif

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
  ruby Selector.map
endfunction

autocmd BufEnter * call MapSelectMatches()
nnoremap  <LEADER>y :<C-U>call CopyLineNumber()<CR>
map  <LEADER>Y :call CopyLines()<CR>

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/selector")
      require "#{path}/ruby/selector/selector.rb"
    end
  end
EOF

