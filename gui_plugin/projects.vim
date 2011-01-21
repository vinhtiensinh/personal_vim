function! GetCurrentProject()
  return g:current_project
endfunction

function! SetCurrentProject(project)
  let g:current_project = a:project
endfunction

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
    call SetCurrentProject(a:name)
    call SwitchPath(project_path)
  endif
endfunction

function! SwitchPath(path)
  execute 'cd ' . a:path
  if IsNERDTreeWindowOpen()
    exec ":NERDTreeToggle"
    exec ":NERDTree " . getcwd()
  else
    let g:NERDTree_need_update = 1
  endif
endfunction

function! SwitchToPath()

  let path = input("Path: ", '', 'file')
  if path == ''
    return
  endif
  call SwitchToProjectCmd(ProjectNameOf(fnamemodify(path, ':p')))

endfunction

function! ProjectNameOf(name)
  for project in g:projects
    if a:name =~ project[1]
      return project[0]
    endif
  endfor

  return PathOf(a:name)
endfunction

function! ProjectPathOf(name)
  for project in g:projects
    if a:name == project[0] && isdirectory(project[1])
      return project[1]
    endif
  endfor

  return a:name
endfunction

function! IsInProject(name)
  if ProjectNameOf(fnamemodify(a:name, ':p')) !~ '\~' && ProjectNameOf(fnamemodify(a:name, ':p')) !~ '\/'
    return 1
  endif
  return 0
endfunction

function! FolderNameOf(name)
  let folder = fnamemodify(fnamemodify(a:name, ":h"), ":t")
  if folder !~ '\.'
    let folder = '..'.folder
  endif

  return folder
endfunction

function! PathOf(name)
  return substitute(fnamemodify(a:name, ":h"), $HOME, "~", "")
endfunction

