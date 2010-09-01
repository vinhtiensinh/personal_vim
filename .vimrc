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

map <LEADER>f :FufFile ./**/<ENTER>
map <LEADER>b :FufMruFile<ENTER>

map ; :
map <LEADER>t :TlistToggle<ENTER>
map <LEADER>on :vsplit<SPACE>
map <LEADER>cm :NERDComToggleComment<ENTER>
map <LEADER>gd :VCSVimDiff<ENTER>
map <LEADER>os <C-]>
map <LEADER>oc gf
map <LEADER>r :!perl %<ENTER>

map <LEADER>90 :BufExplorer<ENTER>j<ENTER>

let g:sql_type_default = 'mysql'

vmap df >
vmap fd <

map v <C-v>
imap ;; ::
