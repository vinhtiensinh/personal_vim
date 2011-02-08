set mouse=a
set selectmode=mouse
autocmd VimEnter * call SwitchToProject()
autocmd TabEnter * execute ":UMiniBufExplorer"

silent! set macmeta

:macm File.Close key=<M-w>
:macm Tools.List\ Errors key=<M-l>
:macm Tools.Make key=<M-b>

let g:miniBufExplUseSingleClick = 1
let gui_plugins = split(glob("~/.vim/gui_plugin/*"), "\n")

for plugin in gui_plugins
  if plugin =~ '.rb'
    continue
  endif

  execute "so " .  plugin
endfor

" Custom status line
set statusline=%F\ %=[\ %{GetCurrentProject()}\ ]%=[\ %c\ :\ %l\ :\ %L\ ]\ %h\ (%P)

set guioptions-=T
set guioptions-=L
set guioptions-=r
set go+=b
set guifont=Consolas:h16

map <S-Space> <ESC>:w<CR>
vmap <S-Space> <ESC>:w<CR>
cmap <S-Space> <ESC>:w<CR>
omap <S-Space> <ESC>:w<CR>
imap <silent> <S-Space> <ESC>:w<CR>

map <D-w> :tabclose<CR>
map <LEADER>d :bd<CR>

imap <D-A> <ESC>A
imap <D-I> <ESC>I
imap <D-h> <Left>
imap <D-j> <Down>
imap <D-k> <Up>
imap <D-l> <Right>
imap <D-w> <Right><ESC>wi
imap <D-e> <Right><ESC>ea
imap <D-b> <ESC>bi
imap <D-d> <ESC>xi
imap <D-D> <ESC>lxi

"delete next and previous word in insert mode
imap <D-[> <ESC>lvBxi
imap <D-]> <ESC>lvExi

"navigating between split windows
map <D-CR> <C-w>w
map <D-H> <C-w>h
map <D-J> <C-w>j
map <D-K> <C-w>k
map <D-L> <C-w>l
map <D-<> 5<C-w><
map <D->> 5<C-w>>
map <D-_> 5<C-w>-
map <D-+> 5<C-w>+

"redo with D-2 (@ for easily remember)
map <D-2> <C-r>

"map scrolling
map <D-j> <C-d>
map <D-k> <C-u>
map <D-u> <C-e>
map <D-i> <C-y>

" -------------------------------------------------------------------------------

" Taglist config
so $HOME/.vim/plugin/taglist.vim
:TlistAddFiles ./tags

map <D-3> :call ToggleTagList()<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_Auto_Update = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 0

map <LEADER><LEADER> :CommandTFlush<CR>:CommandT<CR>
let g:CommandTCancelMap = '<SPACE>'
let g:CommandTSelectNextMap = "<Tab>"
let g:CommandTSelectPrevMap = "<S-Tab>"
let g:CommandTAcceptSelectionSplitMap = '<S-Space>'
let g:CommandTAcceptSelectionVSplitMap = '<S-CR>'

" Loclist open and close
let g:syntastic_auto_loc_list = 1
"-------------------------------------------------------------------------
vmap <LEADER>nrw :Narrow<CR>
vmap <LEADER>wid :Widen<CR>

smap ' s'
smap " s"

" Open file from clipboard
map <LEADER>e :call OpenFilesFromClipboard('e')<CR>

"use sign for checking syntax
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>

nmap <Tab> :call NextBuffer()<CR>
nmap <S-Tab> :call PreviousBuffer()<CR>

"tryingout minibufexplorer
let g:miniBufExplVSplit = 25 
let g:miniBufExplMinSize = 31 
let g:miniBufExplMaxSize = 31 
"let g:miniBufExplAutoClose = 1

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
map <LEADER>W :TMiniBufExplorerCloseAllOthers<CR>

:highlight CursorLine guibg=grey10

"nerd tree size
"let NERDTreeWinSize = 60

function! ToggleTagList()
  let current_win = winnr()
  execute ":TlistToggle"
  execute current_win . " wincmd w"
endfunction

"transparency stuff
"not sure if use it when already have Divvy
map <D-@> :call ToggleTransparency()<CR>
let g:transparency = 0
function! ToggleTransparency()
  if g:transparency == 0
    set transparency=25
    let g:transparency = 25
  else
    set transparency=0
    let g:transparency=0
  endif
endfunction

map gt :call GTTabMove('next')<CR>
map gT :call GTTabMove('previous')<CR>
function! GTTabMove(direction)
  if IsBufExplorerOpen() && tabpagenr('$') == 1
    if a:direction == 'next'
      call NextBuffer()
    else
      call PreviousBuffer()
    endif
  elseif a:direction == 'next'
    normal! gt
  else
    normal! gT
  endif

endfunction
