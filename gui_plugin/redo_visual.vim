let g:current_selection = ''
function! SetCurrentSelection(selection)
  let g:current_selection = a:selection
endfunction

function! RepeatSelection()
  execute "normal " . g:current_selection
endfunction
 
function! RepeatSelectionInsert()
  call RepeatSelection()
  call feedkeys("\<C-g>")
endfunction

function! RepeatSelectionRemap(icommand, selection)
  execute "map "a:icommand.a:selection." <ESC>:call SetCurrentSelection('v".a:selection."')<CR>:call feedkeys('"a:icommand.a:selection."', 'n')<CR>"
endfunction

let commands = ['c', 'y', 'd', 'v']
let selectionModes = ['i', 'a']
let selections     = ['w', 'W', '"', 'b', 'B', '(', ')', '{', '}', '[', ']', '<', '>', 'p', 's', 't', '`']


for icommand in commands
  for selectionMode in selectionModes
    for selection in selections
      let selection = selectionMode.selection
      call RepeatSelectionRemap(icommand, selection)
    endfor
  endfor
endfor

vmap i' <ESC>:call SetCurrentSelection("vi'")<CR>:normal! vi'<CR>
omap i' :normal vi'<CR>

map <D-'> <ESC>:call RepeatSelection()<CR>
imap <D-'> <ESC>:call RepeatSelectionInsert()<CR>
