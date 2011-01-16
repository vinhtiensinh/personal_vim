autocmd FileWritePost,BufWritePost * call RSync(expand('%')) 
function! RSync(file)
  let file_full_path = fnamemodify(a:file, ':p')
  for rsync in g:rsync
    if file_full_path =~ rsync[0]
      let destination_path = substitute(file_full_path, rsync[0], rsync[1], '')
      let output = system('rsync '.file_full_path.' '.destination_path)
      return
    endif
  endfor
endfunction
