let gui_plugins = split(glob("~/.vim/gui_plugin/*"), "\n")

for plugin in gui_plugins
  if plugin =~ '.rb'
    continue
  endif

  execute "so " .  plugin
endfor

set guioptions-=T
set guioptions-=L
set guioptions-=r
set go+=b
set guifont=Consolas:h16

silent! set macmeta
map <S-Space> <ESC>:w<CR>
imap <silent> <S-Space> <ESC>:w<CR>

map <D-w> :bd<CR>
imap <D-w> <ESC><D-w>

"for perl only move to next
imap <D-"> <Right>
imap <D-'> <ESC>A;

"delete next and previous word in insert mode
imap <D-[> <ESC>lvBxi
imap <D-]> <ESC>lvExi

"navigating between split windows
map <D-H> <C-w>h
map <D-J> <C-w>j
map <D-K> <C-w>k
map <D-L> <C-w>l
map <D-<> 5<C-w><
map <D->> 5<C-w>>
map <D-_> 5<C-w>-
map <D-+> 5<C-w>+

map <D-e> :call OpenFilesFromClipboard('e')<CR>

"map scrolling
map <D-j> <C-d>
map <D-k> <C-u>
map <D-u> <C-e>
map <D-i> <C-y>

" -------------------------------------------------------------------------------

let inumber = 1

while inumber < 100
  execute "map  " . inumber . "<Space> " . ":call GotoBuffer(" . inumber . ")<CR>"
  execute "map  " . inumber . "<S-Space> " . ":split<CR>".inumber."<Space>"
  execute "map  " . inumber . "<S-Space><S-Space> " . ":vsplit<CR>".inumber."<Space>"
  let inumber = inumber + 1
endwhile
map 0<LEADER> :BufExplorer<CR><Down><CR>

function! ToggleNERDTreeAndBufExplorer()
    exec ":NERDTreeToggle " . ProjectPathOf(g:current_project)
    exec ":TMiniBufExplorer"
endfunction

"show file drawer
map <LEADER>/ :call ToggleNERDTreeAndBufExplorer()<CR>
map <RightMouse> :call ToggleNERDTreeAndBufExplorer()<CR>

" Taglist config
so $HOME/.vim/plugin/taglist.vim
if(has('gui'))
  :TlistAddFiles ./tags
endif
map <Space>; :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1

map <LEADER><LEADER> :CommandT<CR>
let g:CommandTCancelMap = '<SPACE>'
let g:CommandTSelectNextMap = "<Tab>"
let g:CommandTSelectPrevMap = "<S-Tab>"
let g:CommandTAcceptSelectionVSplitMap = '<S-CR>'

"-------------------------------------------------------------------------
vmap <LEADER>nrw :Narrow<CR>
vmap <LEADER>wid :Widen<CR>

" Open file from clipboard
map <LEADER>e :call OpenFilesFromClipboard('e')<CR>

"use sign for checking syntax
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>

map <Tab> :call NextBuffer()<CR>
map <S-Tab> :call PreviousBuffer()<CR>

"quit the second window
map <LEADER>w :bd<CR>
"tryingout minibufexplorer
let g:miniBufExplVSplit = 25
let g:miniBufExplMinSize = 30
let g:miniBufExplMaxSize = 30

autocmd BufDelete * :UMiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplForceSyntaxEnable = 1
map <LEADER>W :TMiniBufExplorerCloseAllOthers<CR>
