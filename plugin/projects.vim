let g:projects = [
  \ ['product-e2e', '/Users/vinh_tran/product-e2e', 'pe2e'],
  \ ['customer-platform', '/Users/vinh_tran/customer-platform', 'cust'],
  \ ['vim', '/Users/vinh_tran/personal_vim', '.vim'],
  \ ['vim', '/Users/vinh_tran/.vim', '.vim'],
  \ ['agentdesktop', '/Users/vinh_tran/branches/master/agentdesktop', 'agdk'],
  \ ['agentdesktop', '/web/home/vtran/branches/master/agentdesktop', 'agdk'],
  \ ['librea', '/Users/vinh_tran/branches/master/librea', 'brea'],
  \ ['librea', '/web/home/vtran/branches/master/librea', 'brea'],
  \ ['reaxml', '/Users/vinh_tran/branches/master/reaxml', 'rxml'],
  \ ['reaxml', '/web/home/vtran/branches/master/reaxml', 'rxml'],
  \ ['jetwire', '/Users/vinh_tran/branches/master/jetwire', 'jetw'],
  \ ['db-migrations', '/Users/vinh_tran/db-migrations', 'dbm']
\]

autocmd VimEnter * let g:current_project = ProjectNameOf(expand('%:p')) == '' ? 'unset' : ProjectNameOf(expand('%:p'))

function! SwitchToProject()
  let current_buffer = expand('%:p')
  let name = ProjectNameOf(current_buffer)

  if name != ''
    call SwitchToProjectCmd(name)
  endif
endfunction

function! SwitchToProjectCmd(name)

  let project_path = ProjectPathOf(a:name)
  if project_path != ''
      execute 'cd ' . project_path
      let g:current_project = a:name
      execute ":CMiniBufExplorer"
      execute ":NERDTree " . ProjectPathOf(g:current_project)

      if (has('ruby'))
        ruby Cucumber.fetch_all_steps
      endif
  endif
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
    if a:name == project[0] && isdirectory(project[1])
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
