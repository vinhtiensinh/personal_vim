let mapleader = ' '
let maplocalleader = '\'
set undofile

set noswapfile
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set smartindent
set autoindent
set title
set nocompatible
set cursorline
set relativenumber

set splitright

set fillchars=vert:\ 

colorscheme vividchalk
syntax on
filetype on
filetype plugin on
filetype indent on

set ignorecase
set incsearch

set wildchar=<Tab> wildmenu wildmode=list:longest
set wildignore=.o,.obj,.git,*.swp,*.*~,*.gif,*.png,*.ico,*.jpg,vendor,*.class,*.gem,*.gz,dependencies,tmp,_build,cover_db

map  <LEADER>v <C-v>

map g<Space> g<C-]>
map g<Tab> g<S-Space><C-w>T
map g<S-Space> :split<CR>g<C-]>
map g<S-CR> :vsplit<CR>g<C-]>

" Status line
"------------------------------------------------------------------------
" Color the status line
hi StatusLine ctermfg=blue ctermbg=lightgrey

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
map <LEADER>'w viws'
map <LEADER>') vi)s'
map <LEADER>'} vi}s'
map <LEADER>'] vi]s'
map <LEADER>'( vi(s'
map <LEADER>'a vias'
map <LEADER>'' cs"'

map <LEADER>"w viws"
map <LEADER>") vi)s"
map <LEADER>"( vi(s"
map <LEADER>"} vi}s"
map <LEADER>"] vi]s"
map <LEADER>"a vias"
map <LEADER>"" cs'"

map <LEADER>3 ,c<SPACE>

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
nmap <Space><CR> i<CR><ESC>

"edit mode keymap
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>

"close surrounding windows
map <LEADER>H <C-w>h:q<CR>
map <LEADER>J <C-w>j:q<CR>
map <LEADER>K <C-w>k:q<CR>
map <LEADER>L <C-w>l:q<CR>

"folding the block
nnoremap <silent> za :call ToggleFolding()<CR>

function! ToggleFolding()
  if foldclosed('.') == -1 && &foldmethod == 'manual'
    call feedkeys('zf%')
  else
    normal! za
  endif
endfunction

omap <silent> ic <Plug>CamelCaseMotion_iw
xmap <silent> ic <Plug>CamelCaseMotion_iw

map gw :Utl<CR>

silent! so ./.localvimrc
