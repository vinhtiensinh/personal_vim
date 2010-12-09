let g:projects = [
  \ ['product-e2e', '/Users/vinh_tran/product-e2e', 'pe2e'],
  \ ['customer-platform', '/Users/vinh_tran/customer-platform', 'cust'],
  \ ['vim', '/Users/vinh_tran/personal_vim', '.vim'],
  \ ['vim', '/Users/vinh_tran/.vim', '.vim'],
  \ ['agentdesktop', '/Users/vinh_tran/branches/master/agentdesktop', 'agdk'],
  \ ['librea', '/Users/vinh_tran/branches/master/librea', 'brea'],
  \ ['reaxml', '/Users/vinh_tran/branches/master/reaxml', 'rxml'],
  \ ['jetwire', '/Users/vinh_tran/branches/master/jetwire', 'jetw'],
  \ ['db-migrations', '/Users/vinh_tran/db-migrations', 'dbm']
\]

autocmd BufNew * call SwitchToProject()

function! SwitchToProject()
  let current_buffer = expand('%:p')
  let name = ProjectNameOf(current_buffer)

  if name != ''
    call SwitchToProjectCmd(name)
  endif
endfunction

function! SwitchToProjectCmd(name)

  for project in g:projects
    if a:name == project[0]
      execute 'cd ' . project[1]
      let g:current_project = project[0]

      "if (IsBufExplorerOpen())
        "exec ":NERDTree " . ProjectPathOf(g:current_project)
        "exec ":NERDTreeToggle"
      "else
        "exec ":NERDTree " . ProjectPathOf(g:current_project)
      "endif

      if (has('ruby'))
        ruby Cucumber.fetch_all_steps
      endif
      return
    endif
  endfor

endfunction

function! SwitchToProjectByName()

  let name = input("Project: ")
  if name == ''
    return
  endif
  
  call SwitchToProjectCmd(name)
endfunction
 
function! ProjectNameOf(name)
  for project in g:projects
    if a:name =~ project[1]
      return project[0]
    endif
  endfor

  return ''
endfunction

function! ProjectPathOf(name)
  for project in g:projects
    if a:name == project[0]
      return project[1]
    endif
  endfor

  return ''
endfunction

function! ProjectAbbrOf(name)
  for project in g:projects
    if a:name =~ project[1]
      return project[2]
    endif
  endfor

  return ''
endfunction
