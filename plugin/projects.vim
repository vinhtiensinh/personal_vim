let g:projects = [
  \ ['product-e2e', '/Users/vinh_tran/product-e2e'],
  \ ['customer-platform', '/Users/vinh_tran/customer-platform'],
  \ ['vim', '/Users/vinh_tran/personal_vim'],
\]

autocmd BufEnter * call SwitchToProject()

function! SwitchToProject()
  let current_buffer = bufname('%')
  for project in g:projects
    if current_buffer =~ project[1]
      execute 'cd ' . project[1]
      let g:current_project = project[0]
      echo "Current Project: " . g:current_project
    endif
  endfor
endfunction

function! SwitchToProjectByName(name)
  for project in g:projects
    if a:name == project[0]
      execute 'cd ' . project[1]
      let g:current_project = project[0]
      echo "Current Project: " . g:current_project
    endif
  endfor
endfunction
