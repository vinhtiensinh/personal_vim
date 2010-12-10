function! GotoBuffer(index)

  let winNum = FindWindow('-MiniBufExplorer-')
  exec l:winNum.' wincmd w'

  call feedkeys(a:index . "G")
  call feedkeys("\<CR>")
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
