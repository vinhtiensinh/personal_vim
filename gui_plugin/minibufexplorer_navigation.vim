function! GotoBuffer(index)

  let winNum = FindWindow('-MiniBufExplorer-')
  exec l:winNum.' wincmd w'

  if getline(a:index) =~ '\[.*\]'
    let project_name = getline(a:index)
    let project_name = substitute(project_name, '^\s*\[', '', '')
    let project_name = substitute(project_name, '\].*', '', '')

    call SwitchToProjectCmd(project_name)
    exec 'wincmd p'
    return
  endif

  call feedkeys(a:index . "G")
  call feedkeys("\<CR>")
endfunction

function! PreviousBuffer()
  let winNum = FindWindow('-MiniBufExplorer-')
  exec l:winNum.' wincmd w'
  let last_line = getpos('$')[1]

  let current = 1
  while (current <= last_line)
    if getline(current) =~ '\*'
      break
    else
      let current = current + 1
    endif
  endwhile

  while(1)
    if current == 1
      let current = last_line
    else
      let current = current - 1
    endif

    if getline(current) !~ '\[.*\]'
      call GotoBuffer(current)
      return
    endif
  endwhile
endfunction

function! NextBuffer()
  let winNum = FindWindow('-MiniBufExplorer-')
  exec l:winNum.' wincmd w'

  let current = 1
  let last_line = getpos('$')[1]

  while(current <= last_line)
    if getline(current) =~ '\*'
      break
    else
      let current = current + 1
    endif
  endwhile

  while(1)
    if current == last_line
      let current = 1
    else
      let current = current + 1
    endif

    if getline(current) !~ '\[.*\]'
      call GotoBuffer(current)
      return
    endif
  endwhile
endfunction

function! IsBufExplorerOpen()
  return FindWindow('-MiniBufExplorer-') != -1
endfunction

function! IsNERDTreeWindowOpen()
    if exists("t:NERDTreeBufName")
        return FindWindow(t:NERDTreeBufName) != -1
    else
        return 0
    endif
endfunction
 
function! FindWindow(bufName)
    " Try to find an existing window that contains 
    " our buffer.
    let bufNum = bufnr(a:bufName)
    if bufNum != -1
        let winNum = bufwinnr(l:bufNum)
    else
        let winNum = -1
    endif

    return winNum
endfunction
