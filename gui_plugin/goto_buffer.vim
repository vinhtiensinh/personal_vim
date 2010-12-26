function! GotoBuffer(index)

  let winNum = FindWindow('-MiniBufExplorer-')
  exec l:winNum.' wincmd w'

  if getline(a:index) =~ '\[.*\]'
    exec 'wincmd p'
    exec "echo 'is not a buffer'"
    return
  endif

  call feedkeys(a:index . "G")
  call feedkeys("\<CR>")
endfunction

function! NextBuffer()
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

  if current == last_line
    call GotoBuffer(1)
  else
    call GotoBuffer(current + 1)
  endif
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

  if current == 1
    call GotoBuffer(last_line)
  else
    call GotoBuffer(current - 1)
  endif
endfunction

function! IsBufExplorerOpen()
  return FindWindow('-MiniBufExplorer') != -1
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
