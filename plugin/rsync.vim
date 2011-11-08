autocmd FileWritePost,BufWritePost * call RSync(expand('%')) 
function! RSync(file)
  if !exists('g:rsync')
    return
  endif

  let file_full_path = fnamemodify(a:file, ':p')

  if IsExcluded(file_full_path)
    return
  endif

  for rsync in g:rsync
    if file_full_path =~ rsync[0]
      let destination_path = substitute(file_full_path, rsync[0], rsync[1], '')
      let output = system('rsync -a '.file_full_path.' '.destination_path)
      return
    endif
  endfor
endfunction

function! IsExcluded(file)
  if (!exists('g:rsync_excludes')) 
    return
  endif

  for exclude in g:rsync_excludes
    if a:file =~ exclude
      return 1
    endif
  endfor

  return 0
endfunction
