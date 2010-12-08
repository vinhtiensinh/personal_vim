let g:projects = [
  \ ['product-e2e', '/Users/vinh_tran/product-e2e', 'pe2e'],
  \ ['customer-platform', '/Users/vinh_tran/customer-platform', 'cust'],
  \ ['vim', '/Users/vinh_tran/personal_vim', '.vim'],
  \ ['agentdesktop', '/Users/vinh_tran/branches/master/agentdesktop', 'agdk'],
  \ ['librea', '/Users/vinh_tran/branches/master/librea', 'brea'],
  \ ['reaxml', '/Users/vinh_tran/branches/master/reaxml', 'rxml'],
  \ ['jetwire', '/Users/vinh_tran/branches/master/jetwire', 'jetw']
\]

autocmd BufEnter * call SwitchToProject()

function! SwitchToProject()
  let current_buffer = expand('%:p')
  for project in g:projects
    if current_buffer =~ project[1]
      execute 'cd ' . project[1]
      let g:current_project = project[0]
    endif
  endfor
endfunction

function! SwitchToProjectByName(name)
  for project in g:projects
    if a:name == project[0]
      execute 'cd ' . project[1]
      let g:current_project = project[0]
    endif
  endfor
endfunction

function! ProjectOf(name)
  for project in g:projects
    if a:name =~ project[1]
      return project[2]
    endif
  endfor

  return ''
endfunction
