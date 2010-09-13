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


nnoremap gf <C-W>gf
cab      e  tabe
tab sball

set wildchar=<Tab> wildmenu wildmode=full
set wildignore=*.git,*.swp 

map ; :
map + gt
map _ gT
map \| <C-w>h
map \|\| <C-w>l

let g:fuf_modesDisable = []
let g:fuf_keyOpenTabpage = '<CR>'

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
map <LEADER>er :!perl %<ENTER>
map <LEADER>al :!~/.vim/scripts/psvAlign.pl %<ENTER>

"method to find, find file, fine buffer, find tag etc
map <LEADER>ft :TlistToggle<ENTER>
map <LEADER>ff :FufFile ./**/<ENTER>
map <LEADER>fb FufMruFile<ENTER>

" show mark
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"to speed up processing, any optimize vim config should be place in the .vimrc
"of that dir.
so ./.localvimrc
