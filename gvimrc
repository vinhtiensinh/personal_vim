silent! so ~/.vim/vimrc

set cursorline
set mouse=a
set selectmode=mouse
silent! set macmeta

:macm File.Close key=<M-w>
:macm Tools.List\ Errors key=<M-l>
:macm Tools.Make key=<M-b>

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
set guifont=Courier_New:h16

map  <D-s> <ESC>:wa<CR>
vmap <D-s> <ESC>:w<CR>
cmap <D-s> <ESC>:w<CR>
omap <D-s> <ESC>:w<CR>
imap <silent> <D-s> <ESC>:w<CR>

map <D-w> :call CommandW()<CR>
map <Space>x :bd<CR>

imap <D-L> <ESC>A
imap <D-H> <ESC>I
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
map <D-]> <C-w>w
map <D-[> <C-w>p
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
map <D-h> g^
map <D-l> g$

map <D-P> $a<Space><ESC>p

"-------------------------------------------------------------------------
map <D-3> :call ToggleTagList()<CR>
"-------------------------------------------------------------------------
" Open file from clipboard
nmap <MiddleMouse> :call OpenFilesFromClipboard('e')<CR>

" Somehow this doesnt work on terminal
nmap <ESC> :w<CR>

"use sign for checking syntax
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_disabled_filetypes = ['cucumber']

"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>
:highlight CursorLine guibg=grey10

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

function! CommandW()
  if tabpagenr('$') == 1
    call feedkeys(":bd\<CR>")
  else
    call feedkeys(":tabclose\<CR>")
  endif
endfunction

"transparency stuff
"not sure if use it when already have Divvy
map <D-@> :call ToggleTransparency()<CR>
imap <D-@> <ESC>:call ToggleTransparency()<CR>a

map <D-'> <ESC>:call RepeatSelection()<CR>
imap <D-'> <ESC>:call RepeatSelectionInsert()<CR>

map <D-1> :call ToggleBetweenNERDTreeAndBufExplorer()<CR>
nmap <RIGHTMOUSE> :call ToggleBetweenNERDTreeAndBufExplorer()<CR>

map <D-!> :call CloseNERDTreeAndBufExplorer()<CR>
