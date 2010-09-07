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

set wildchar=<Tab> wildmenu wildmode=full
set wildignore=*.git,*.swp 

map ; :
map [ gT
map ] gt
map 9 <C-w>h
map 99 <C-w>j
map 0 <C-w>l
map 00 <C-w>k

map <LEADER>al :!~/.vim/scripts/psvAlign.pl %<ENTER>

let g:fuf_modesDisable = []
let g:fuf_keyOpenTabpage = '<CR>'

so $HOME/.vim/plugin/cmdalias.vim

:Alias gd VCSVimDiff
:Alias gs VCSStatus
:Alias gb VCSBlame
:Alias gl VCSLog


"method to jump, jump to a step, jump to a class etc
:Alias js <C-]>
:Alias jc gf

"method to execute a command, run perl test
map <LEADER>er :!perl %<ENTER>
:Alias ucm NERDComToggleComment

"method to find, find file, fine buffer, find tag etc
map <LEADER>ff :FufFile ./**/<ENTER>
:Alias fb FufMruFile
:Alias ft TlistToggle

"greping methods
:Alias grp Rgrep
