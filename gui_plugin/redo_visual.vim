let g:current_selection = ''
function! SetCurrentSelection(selection)
  let g:current_selection = a:selection
endfunction

function! RepeatSelection()
  if g:current_selection == ''
    return
  endif
  execute "normal " . g:current_selection
endfunction
 
function! RepeatSelectionInsert()
  call RepeatSelection()
  call feedkeys("\<C-g>")
endfunction

function! RepeatSelectionRemap(icommand, selection)
  execute "nmap ".a:icommand.a:selection." <ESC>:call SetCurrentSelection('v".a:selection."')<CR>:call feedkeys('".a:icommand.a:selection."', 'n')<CR>"
endfunction

let icommands = ['c', 'y', 'd', 'v']
let selectionModes = ['i', 'a']
let selections     = ['w', 'W', '"', 'b', 'B', '(', ')', '{', '}', '[', ']', '<', '>', 'p', 's', 't', '`']

for icommand in icommands
  for selectionMode in selectionModes
    for selection in selections
      let selection = selectionMode.selection
      call RepeatSelectionRemap(icommand, selection)
    endfor
  endfor
  execute "nmap ".icommand."i'".' <ESC>:call SetCurrentSelection("'."vi'".'")<CR>:call feedkeys("'.icommand."i'".'", "n")<CR>'

  execute "nmap ".icommand."a'".' <ESC>:call SetCurrentSelection("'."va'".'")<CR>:call feedkeys("'.icommand."a'".'", "n")<CR>'
endfor

map <D-'> <ESC>:call RepeatSelection()<CR>
imap <D-'> <ESC>:call RepeatSelectionInsert()<CR>
