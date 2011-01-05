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
    let g:current_project = a:name
    call SwitchPath(project_path)
  endif
endfunction

function! SwitchPath(path)
  execute 'cd ' . a:path
  if IsNERDTreeWindowOpen()
    exec ":NERDTreeToggle"
    exec ":NERDTree " . getcwd()
  endif

  if IsBufExplorerOpen()
    let g:NERDTree_need_update = 1
  endif

  if (has('ruby'))
    ruby Cucumber.fetch_all_steps
  endif
endfunction

function! SwitchToPath()

  let path = input("Path: ", '', 'file')
  if path == ''
    return
  endif
  call SwitchPath(path)

endfunction

function! ProjectNameOf(name)
  for project in g:projects
    if a:name =~ project[1]
      return project[0]
    endif
  endfor
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
  return FolderNameOf(a:name)
endfunction

function! FolderNameOf(name)
  return substitute(fnamemodify(a:name, ":h"), ".*/", "", "")
endfunction

function! ProjectNameOrFolderNameOf(name)
  let project_name = ProjectNameOf(a:name)

  if project_name == ''
    return FolderNameOf(a:name)
  else
    return project_name
  endif
endfunction
