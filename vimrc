let mapleader = ' '

set guioptions=T 

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
set wildignore=*.git,*.swp 

map ; :
map + gt
map _ gT
map \| <C-w>w
map  <LEADER>v <C-v>
imap <LEADER><TAB> <C-x><C-o>

so $HOME/.vim/plugin/cmdalias.vim
so $HOME/.vim/plugin/taglist.vim

:TlistAddFiles ./tags

:Alias gid VCSVimDiff
:Alias gis VCSStatus
:Alias gib VCSBlame
:Alias gil VCSLog

"method to jump, jump to a step, jump to a class etc
map <TAB> <C-W><C-]><C-W>T

"method to execute a command, run perl test
map <LEADER>er :!perl %<CR>
map <LEADER>al :!~/.vim/scripts/psvAlign.pl %<CR>

"method to find, find file, fine buffer, find tag etc
map <LEADER>ft :TlistToggle<CR>
map <LEADER><LEADER> :CommandT<CR>
let g:CommandTAcceptSelectionTabMap='<CR>'

" Color the status line
hi StatusLine ctermfg=blue ctermbg=lightgrey

"-----------------------------------------------------------------
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

"------------------------------------------------------------------------
" searching
" Highlight search matches
set hlsearch
" Start searching immediately - even before <Enter> is pressed
set incsearch
" Make searches case-insensitive, unless you use upcase
set ignorecase
set smartcase
" show mark
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" Set autoclose,  the quote is border line because once you inside move out is
" abit annoying,  not remove it from here
imap (<CR> ()<Left><CR><CR><Up><TAB>
imap {<CR> {}<Left><CR><CR><Up><TAB>
imap [<CR> []<Left><CR><CR><Up><TAB>
"to speed up processing, any optimize vim config should be place in the .localvimrc
"of that dir.
so ./.localvimrc
