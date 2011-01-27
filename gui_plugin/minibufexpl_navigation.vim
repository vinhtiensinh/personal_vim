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
  if IsBufExplorerOpen()
    let buf_file = expand('%:t')

    let winNum = FindWindow('-MiniBufExplorer-')
    exec l:winNum.' wincmd w'
    let last_line = getpos('$')[1]

    let current = 1
    while (current <= last_line)
      if getline(current) =~ buf_file.'\*'
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
  endif

  if IsNERDTreeWindowOpen()
    let winNum = FindWindow(t:NERDTreeBufName)
    exec l:winNum.' wincmd w'
    call feedkeys("k\<CR>")
  endif
endfunction

function! NextBuffer()
  if IsBufExplorerOpen()
    let buf_file = expand('%:t')

    let winNum = FindWindow('-MiniBufExplorer-')
    exec l:winNum.' wincmd w'

    let current = 1
    let last_line = getpos('$')[1]

    while(current <= last_line)
      if getline(current) =~ buf_file.'\*'
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
  endif

  if IsNERDTreeWindowOpen()
    let winNum = FindWindow(t:NERDTreeBufName)
    exec l:winNum.' wincmd w'
    call feedkeys("j\<CR>")
  endif
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

let inumber = 1

while inumber < 100
  execute "map  " . inumber . "<Space> " . ":call GotoBuffer(" . inumber . ")<CR>"
  execute "map  " . inumber . "<S-Space> " . ":split<CR>".inumber."<Space>"
  execute "map  " . inumber . "<S-CR> " . ":vsplit<CR>".inumber."<Space>"
  execute "map  " . inumber . "<Tab> " . ":tabnew<CR>".inumber."<Space>"
  let inumber = inumber + 1
endwhile
map 0<LEADER> :BufExplorer<CR><Down><CR>

" switching between bufexplorer and nerd tree sometime causing 2
" bufexplorer window to open
" this autocmd is a hacky fix to make sure we remove all duplicate
autocmd BufEnter * call RemoveMiniBufDuplicateWindow()

function! RemoveMiniBufDuplicateWindow()
  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i = 0                     " Set the buffer index to zero.
  let l:miniBufOpened = 0
  while(l:i <= l:NBuffers)
    let l:i = l:i + 1
    let l:BufName = bufname(l:i)
    if l:BufName == '-MiniBufExplorer-' && bufwinnr(l:i) != -1
      if l:miniBufOpened
        execute 'bw '.l:i
      else
        let l:miniBufOpened = 1
      end
    endif
  endwhile
endfunction

function! ToggleBetweenNERDTreeAndBufExplorer()

  if IsBufExplorerOpen()
    exec ":CMiniBufExplorer"

    if !IsNERDTreeWindowOpen()

      if exists("g:NERDTree_need_update") && g:NERDTree_need_update
        exec ":NERDTree " . getcwd()
        let g:NERDTree_need_update = 0
      else
        exec ":NERDTreeToggle"
      end
    endif
    return

  else

    if IsNERDTreeWindowOpen()
      exec ":NERDTreeToggle"
      exec ":MiniBufExplorer"
    else
      exec ":MiniBufExplorer"
    endif

  endif
endfunction

function! CloseProject(name)
  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i = 0                     " Set the buffer index to zero.

  while(l:i <= l:NBuffers)
    let l:i = l:i + 1
    let l:fileName = fnamemodify(bufname(l:i), ':p')
    if ProjectNameOf(l:fileName) == a:name && filereadable(l:fileName)
      silent! exec 'bd '.l:i
    endif
  endwhile
endfunction

function! ToggleFoldProject(name)
  if ProjectClosed(a:name)
    call UnFoldProject(a:name)
  else
    call FoldProject(a:name)
  endif
endfunction

function! UnFoldProject(name)
  let tabClosed = GetFoldedProjects()
  tabClosed[a:name] = 0
endfunction

function! FoldProject(name)
  let tabClosed = GetFoldedProjects()
  let tabClosed[a:name] = 1
endfunction

function! GetFoldedProjects()
  if !exists('t:MinibufClosedProjects')
    let t:MinibufFoldedProjects = {}
  endif
  return t:MinibufFoldedProjects
endfunction

function! CloseNERDTreeAndBufExplorer()
    if IsNERDTreeWindowOpen()
      exec ":NERDTreeToggle"
    endif

    if IsBufExplorerOpen()
      exec ":TMiniBufExplorer"
    endif
    return
endfunction

"show file drawer
map <D-1> :call ToggleBetweenNERDTreeAndBufExplorer()<CR>
map <D-!> :call CloseNERDTreeAndBufExplorer()<CR>
