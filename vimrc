let mapleader = ' '

set guioptions-=T
set guifont=Menlo:h14

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
set wildignore=.git,*.swp 

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
map <LEADER>alp :!~/.vim/scripts/psvAlign.pl %<CR>

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
" -------------------------------------------------------------------------------
set showtabline=2 " always show tabs in gvim, but not vim
set guitablabel=%N\ %t\ %M
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

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
map <LEADER>al :Align
vmap <LEADER>al :Align
map <LEADER>aleq :Align=<CR>
vmap <LEADER>aleq :Align=<CR>
map <LEADER>alar :Align=><CR>
vmap <LEADER>alar :Align=><CR>
map <LEADER>al; :Align:<CR>
vmap <LEADER>al; :Align:<CR>
map <LEADER>alsq :Align[<CR>
vmap <LEADER>alsq :Align[<CR>

"----------------------------------------------------------------------------------
" quicly open vim config file
map vimrc tabnew ~/.vimrc<CR>
map sovimrc so ~/.vimrc<CR>
map vimabbr tabnew ~/.vim/plugin/abbreviations.vim<CR>

"--------------------------------------------------------------------------------
" seaching by ack
map <LEADER>ss :Ack<SPACE>-i<SPACE>
map <LEADER>sw :exe "Ack -i " . expand("<cword>")<CR>
" -------------------------------------------------------------------------------
:Alias nrr Narrow
:Alias wid Widen 
"to speed up processing, any optimize vim config should be place in the .localvimrc
"of that dir.
so ./.localvimrc
