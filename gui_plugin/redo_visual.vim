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

function! RepeatSelectionRemap(selection)
  execute "vmap ".a:selection." <ESC>:call SetCurrentSelection('v".a:selection."')<CR>:normal! v".a:selection."<CR>"
  execute "omap ".a:selection." :normal v".a:selection."<CR>"
endfunction

"let selectionModes = ['i', 'a']
"let selections     = ['w', 'W', '"', 'b', 'B', '(', ')', '{', '}', '[', ']', '<', '>', 'p', 's', 't', '`']

"for selectionMode in selectionModes
  "for selection in selections
    "let selection = selectionMode.selection
    "call RepeatSelectionRemap(selection)
  "endfor
"endfor

"vmap i' <ESC>:call SetCurrentSelection("vi'")<CR>:normal! vi'<CR>
"omap i' :normal vi'<CR>

map <D-'> <ESC>:call RepeatSelection()<CR>
imap <D-'> <ESC>:call RepeatSelectionInsert()<CR>
