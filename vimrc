syntax on
call pathogen#runtime_append_all_bundles() 

let mapleader = ' '

set guioptions-=T 

set softtabstop=2 
set shiftwidth=2 
set tabstop=2 
set expandtab 
set cindent 
set smartindent 
set autoindent 
:colorscheme vividchalk

set wildchar=<Tab> wildmenu wildmode=full

:set number

filetype on
:filetype plugin on
:filetype indent on
:syntax on

map df gt
map fd gT
map DF <C-W>l
map FD <C-W>h
map JK <C-W>j
map KJ <C-W>k

map <LEADER>al :!~/.vim/scripts/psvAlign.pl %<ENTER>

set wildignore=*.git,*.swp 
let g:fuf_modesDisable = []
let g:fuf_keyOpenTabpage = '<CR>'

"method to find, find file, fine buffer, find tag etc
map <LEADER>ff :FufFile ./**/<ENTER>
map <LEADER>fb :FufMruFile<ENTER>
map <LEADER>ft :TlistToggle<ENTER>

"method to jump, jump to a step, jump to a class etc
map <LEADER>js <C-]>
map <LEADER>jc gf

"method to execute a command, run perl test
map <LEADER>er :!perl %<ENTER>

map <LEADER>ucm :NERDComToggleComment<ENTER>
map <LEADER>gitd :VCSVimDiff<ENTER>

map 90 :BufExplorer<ENTER>j<ENTER>

map ; :

let g:sql_type_default = 'mysql'

vmap df >
vmap fd <

map v <C-v>
imap ;; ::
