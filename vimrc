let mapleader = ' '
set nocompatible
set autowrite

set guioptions-=T
set guioptions-=L
set guioptions-=r
set go+=b
set guifont=Consolas:h16
set clipboard=unnamed

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set smartindent
set autoindent

silent! set macmeta
set splitright

colorscheme vividchalk

syntax on
filetype on
filetype plugin on
filetype indent on
syntax on

set number
set ignorecase
set incsearch

set wildchar=<Tab> wildmenu wildmode=full
set wildignore=.git,*.swp,*.*~,*.gif,*.ico,*.jpg,vendor,*.class,*.gem,*.gz,dependencies,tmp

map  <LEADER>v <C-v>
map <S-Space> <ESC>:w<CR>

so $HOME/.vim/plugin/cmdalias.vim
so $HOME/.vim/plugin/taglist.vim

if(has('gui'))
  :TlistAddFiles ./Tags
endif

"method to execute a command, run perl test
map <LEADER>alp :!~/.vim/scripts/psvAlign.pl %<CR>

" find/show file, yand ring, tag etc
map <LEADER><LEADER> :CommandT<CR>
"let g:CommandTAcceptSelectionTabMap = '<CR>'
let g:CommandTCancelMap = '<SPACE>'
let g:CommandTSelectNextMap = '<Tab>'
let g:CommandTAcceptSelectionVSplitMap = '<S-CR>'

"show file drawer
map <D-/> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1


" Taglist config
let Tlist_Exit_OnlyWindow = 1

" Status line
"------------------------------------------------------------------------
" Color the status line
hi StatusLine ctermfg=blue ctermbg=lightgrey
" Custom status line
"set statusline=%F,\ (col\ %c,\ line\ %l)\ of\ %L\ lines\ %h\ (%P)
set statusline=%F,\ %=[\ %c\ :\ %l\ :\ %L\ ]\ %h\ (%P)
" Status line always on
set laststatus=2

" put cursor at last pos when you open file again
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\  exe "normal! g`\"" |
\ endif
" -------------------------------------------------------------------------------
"set showtabline=2 " always show tabs in gvim, but not vim
"autocmd VimEnter * set guitablabel=%N\ %t\ %M

"map  <D-1> 1gt
"imap <D-1> <ESC>1gt
"map  <D-2> 2gt
"imap <D-2> <ESC>2gt
"map  <D-3> 3gt
"imap <D-3> <ESC>3gt
"map  <D-4> 4gt
"imap <D-4> <ESC>4gt
"map  <D-5> 5gt
"imap <D-5> <ESC>5gt
"map  <D-6> 6gt
"imap <D-6> <ESC>6gt
"map  <D-7> 7gt
"imap <D-7> <ESC>7gt
"map  <D-8> 8gt
"imap <D-8> <ESC>8gt
"map  <D-9> 9gt
"imap <D-9> <ESC>9gt
map  <D-0> :tabo<CR>
imap <D-0> <ESC>:tabo<CR>a

function! CloseBuffer()
  call feedkeys(":bd\<CR>")
  call feedkeys(":OMiniBufExplorer\<CR>")
endfunction

map <D-w> :call CloseBuffer()<CR>
imap <D-w> <ESC><D-w>
map  <D-1> :call GotoBuffer(1)<CR>
imap <D-1> <ESC>:call GotoBuffer(1)<CR>
map  <D-2> :call GotoBuffer(2)<CR>
imap <D-2> <ESC>:call GotoBuffer(2)<CR>
map  <D-3> :call GotoBuffer(3)<CR>
imap <D-3> <ESC>:call GotoBuffer(3)<CR>
map  <D-4> :call GotoBuffer(4)<CR>
imap <D-4> <ESC>:call GotoBuffer(4)<CR>
map  <D-5> :call GotoBuffer(5)<CR>
imap <D-5> <ESC>:call GotoBuffer(5)<CR>
map  <D-6> :call GotoBuffer(6)<CR>
imap <D-6> <ESC>:call GotoBuffer(6)<CR>
map  <D-7> :call GotoBuffer(7)<CR>
imap <D-7> <ESC>:call GotoBuffer(7)<CR>
map  <D-8> :call GotoBuffer(8)<CR>
imap <D-8> <ESC>:call GotoBuffer(8)<CR>
map  <D-9> :call GotoBuffer(9)<CR>
imap <D-9> <ESC>:call GotoBuffer(9)<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Tab> :BufExplorer<CR><Down><CR>
map <D-'> :BufExplorer<CR><Down><CR>
" searching
"--------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
" show mark
" -----------------------------------------------------------------------------
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
"-------------------------------------------------------------------------
vmap <LEADER>nrw :Narrow<CR>
vmap <LEADER>wid :Widen<CR>

" Open file from clipboard
map <D-e> :call OpenFilesFromClipboard('e')<CR>
" ------------------------------------------------------------------------
"  Open a shell for command
"to speed up processing, any optimize vim config should be place in the .localvimrc
"of that dir.
set visualbell    "don't beep
set noerrorbells  "dont beep
"------------------------------------------------------------------------
"no backup
set nobackup
set noswapfile
autocmd InsertLeave,FocusLost * :call Autosave()
function! Autosave ()
   if &modified
     silent! write
   endif
endfunction

vmap ' s'
vmap " s"
map <LEADER>' cs"'
map <LEADER>" cs'"

map <LEADER>,, ,c<SPACE>

"hightlight extra space
highlight ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
match ExtraWhitespace /[ \t]\+$/

"use sign for checking syntax
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

"better background
highlight Pmenu guibg=grey14 guifg=moccasin ctermbg=DarkGrey ctermfg=Black

map <LEADER>o :e<SPACE>
map <Tab> <C-]>
map <S-Tab> <C-w><C-v><C-]>
map <LEADER><Tab> <C-w><C-]>

"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>

"quicker autocomplete
set complete -=i

"enter new line without insert mode
map <LEADER><CR> o<S-Space>
nmap <S-CR> i<CR><S-Space>

"map Command J and command K
map <D-j> <C-d>
map <D-k> <C-u>
map <D-u> <C-e>
map <D-i> <C-y>

map <D-CR> <C-w>w
imap <D-CR> <ESC><C-w>w

"edit mode keymap
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>
imap <silent> <S-Space> <ESC>:w<CR>
imap <D-[> <ESC>lvBxi
imap <D-]> <ESC>lvExi

"quit the second window
map <LEADER>w <C-w>w<D-w>

"tryingout minibufexplorer
let g:miniBufExplVSplit = 25
let g:miniBufExplMinSize = 30
let g:miniBufExplMaxSize = 30

autocmd BufDelete * :UMiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

silent! so ./.localvimrc
