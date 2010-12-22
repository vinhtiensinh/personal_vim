let mapleader = ' '
set nocompatible
set mouse=a
set clipboard=unnamed

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set smartindent
set autoindent

set splitright

set fillchars=vert:\ 

colorscheme vividchalk
syntax on
filetype on
filetype plugin on
filetype indent on

set number
set ignorecase
set incsearch

set wildchar=<Tab> wildmenu wildmode=full
set wildignore=.o,.obj,.git,*.swp,*.*~,*.gif,*.ico,*.jpg,vendor,*.class,*.gem,*.gz,dependencies,tmp

map  <LEADER>v <C-v>

map g<Space> g<C-]>

" Status line
"------------------------------------------------------------------------
" Color the status line
hi StatusLine ctermfg=blue ctermbg=lightgrey
" Custom status line
"set statusline=%F,\ (col\ %c,\ line\ %l)\ of\ %L\ lines\ %h\ (%P)
set statusline=%F\ [\ %{ProjectNameOrFolderNameOf(expand('%:p'))}\ ]\ %=[\ %{g:current_project}\ ]%=[\ %c\ :\ %l\ :\ %L\ ]\ %h\ (%P)
" Status line always on
set laststatus=2

" put cursor at last pos when you open file again
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\  exe "normal! g`\"" |
\ endif
" searching
"--------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase

" ------------------------------------------------------------------------
set visualbell    "don't beep
set noerrorbells  "dont beep
"-----------------------------------------------------------------------
vmap ' s'
vmap " s"
map <LEADER>' cs"'
map <LEADER>" cs'"

map <LEADER>,, ,c<SPACE>

"hightlight extra space
highlight ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
match ExtraWhitespace /[ \t]\+$/

"better background
highlight Pmenu guibg=grey14 guifg=moccasin ctermbg=DarkGrey ctermfg=Black

map <LEADER>o :e<SPACE>
map <LEADER>n :n<SPACE>

"Tab in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv

"why bother differenciate between j, k and gj, gk
map j gj
map k gk

"quicker autocomplete
set complete -=i

"enter new line without insert mode
nmap <S-CR> i<CR><ESC>

"edit mode keymap
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>

"folding the block
map zz za

silent! so ./.localvimrc
