autocmd BufNew,BufRead  * call AddToProjectList(ProjectNameOf(fnamemodify(expand('%'), ':p')))

function! GetCurrentProject()
  if (exists('g:use_project_tab') && g:use_project_tab)
    if (exists('t:current_project'))
      return t:current_project
    else
      return ProjectNameOf(getcwd())
    endif
  else
    return ProjectNameOf(getcwd())
  endif
endfunction

function! CurrentProjectPath()
  return ProjectPathOf(GetCurrentProject())
endfunction

function! ProjectList()
  if(!exists('t:project_list'))
    let t:project_list = [] 
  endif
  return t:project_list
endfunction

function! AddToProjectList(project)
  let project_list = ProjectList()
  let project_list += [a:project]

  if(!exists('t:current_project'))
    call SwitchToProject()
  endif
  exec ":UMiniBufExplorer"
endfunction

function! SetCurrentProject(project)
  if (exists('g:use_project_tab') && g:use_project_tab)
    let t:current_project = a:project
  else
    cd ProjectPathOf(a:project)
  end
endfunction

function! FileInProjectList(file)
  if ProjectInProjectList(ProjectNameOf(a:file))
    return 1
  else
    return 0
  endif
endfunction

function! ProjectInProjectList(project)
  for project in ProjectList()
    if project == a:project
      return 1
    endif
  endfor

  return 0
endfunction

function! SwitchToProjectInNewTabCmd(project)
  execute "cd ".ProjectPathOf(a:project) 
  tabnew
endfunction

function! SwitchToTabProject()
  if exists('t:current_project') && t:current_project
    call SwitchToProjectCmd(GetCurrentProject())
  else
    call SwitchToProject()
  endif
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
  execute "cd ".CurrentProjectPath()
  if IsNERDTreeWindowOpen()
    exec ":NERDTreeToggle"
    exec ":NERDTree " . CurrentProjectPath()
  else
    if(exists('g:use_project_tab') && g:use_project_tab)
      let t:NERDTree_need_update = 1
    else
      let g:NERDTree_need_update = 1
    endif
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

