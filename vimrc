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
:Alias diff VCSVimDiff
:Alias difp diffput
:Alias difg diffget

"method to jump, jump to a step, jump to a class etc
map <TAB> <C-W><C-]><C-W>T

"method to execute a command, run perl test
map <LEADER>er :!perl %<CR>
map <LEADER>al :!~/.vim/scripts/psvAlign.pl %<CR>

" find/show file, yand ring, tag etc
map <LEADER>ft :TlistToggle<CR>
map <LEADER>fy :YRShow<CR>
map <LEADER><LEADER> :CommandT<CR>
let g:CommandTAcceptSelectionTabMap='<CR>'

" Status line
"-----------------------------------------------------------------
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

" searching
"-----------------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
" show mark
" -----------------------------------------------------------------------------
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" auto close
" ----------------------------------------------------------------------------
imap (<CR> ()<Left><CR><CR><Up><TAB>
imap {<CR> {}<Left><CR><CR><Up><TAB>
imap [<CR> []<Left><CR><CR><Up><TAB>

" Align text
" ---------------------------------------------------------------------------------
map :al :Align
vmap :al :Align
map :aleq :Align=<CR>
vmap :aleq :Align=<CR>
map :alar :Align=><CR>
vmap :alar :Align=><CR>
map :al; :Align:<CR>
vmap :al; :Align:<CR>
map :alpi :Align\|<CR>
vmap :alpi :Align\|<CR>
map :alsq :Align[<CR>
vmap :alsq :Align[<CR>
"to speed up processing, any optimize vim config should be place in the .localvimrc
"of that dir.
so ./.localvimrc
