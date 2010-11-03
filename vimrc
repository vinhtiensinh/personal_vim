let mapleader = ' '
set nocompatible
set autowrite
set fileformat=mac

set guioptions-=T
set go+=b
set guifont=Consolas:h16
set clipboard=unnamed

set paste

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set smartindent
set autoindent

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
set wildignore=.git,*.swp,*.*~,*.gif,*.ico,*.jpg

map  <LEADER>v <C-v>
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>
imap <S-Space> <ESC>:w<CR>
map <S-Space> <ESC>:w<CR>

so $HOME/.vim/plugin/cmdalias.vim
so $HOME/.vim/plugin/taglist.vim

silent! :TlistAddFiles ./tags
:Alias difp diffput
:Alias difg diffget

"method to execute a command, run perl test
map <LEADER>alp :!~/.vim/scripts/psvAlign.pl %<CR>

" find/show file, yand ring, tag etc
map <LEADER><LEADER> :CommandT<CR>
let g:CommandTAcceptSelectionTabMap='<CR>'

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
\  exe "normal g`\"" |
\ endif
" -------------------------------------------------------------------------------
set showtabline=2 " always show tabs in gvim, but not vim
autocmd VimEnter * set guitablabel=%N\ %t\ %M

map  <D-1> 1gt
imap <D-1> <ESC>1gt
map  <D-2> 2gt
imap <D-2> <ESC>2gt
map  <D-3> 3gt
imap <D-3> <ESC>3gt
map  <D-4> 4gt
imap <D-4> <ESC>4gt
map  <D-5> 5gt
imap <D-5> <ESC>5gt
map  <D-6> 6gt
imap <D-6> <ESC>6gt
map  <D-7> 7gt
imap <D-7> <ESC>7gt
map  <D-8> 8gt
imap <D-8> <ESC>8gt
map  <D-9> 9gt
imap <D-9> <ESC>9gt

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-TAB> :BufExplorer<CR><Down><CR>
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
map <D-e> :call OpenFilesFromClipboard('tabnew')<CR>
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
match ExtraWhitespace /\s\+$/

"use sign for checking syntax
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
let g:syntastic_disabled_filetypes = ['cucumber', 'perl']

"better background
highlight Pmenu guibg=grey14 guifg=moccasin

map <LEADER>o :tabnew<SPACE>
map <Tab> <C-W><C-]><C-W>T

"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>

"quicker autocomplete
set complete -=i

"enter new line without insert mode
map <LEADER><CR> o<ESC>
nmap <CR> o<S-Space>
nmap <S-CR> O<S-Space>

"map Command J and command K
map <D-j> <C-d>
map <D-k> <C-u>
map <D-u> <C-e>
map <D-i> <C-y>

silent! so ./.localvimrc
