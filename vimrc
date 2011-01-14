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
set wildignore=.o,.obj,.git,*.swp,*.*~,*.gif,*.png,*.ico,*.jpg,vendor,*.class,*.gem,*.gz,dependencies,tmp,_build

map  <LEADER>v <C-v>

map g<Space> g<C-]>
map g<S-Space> :split<CR>g<C-]>
map g<S-Space><S-Space> :vsplit<CR>g<C-]>

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
map <LEADER>' cs"'
map <LEADER>" cs'"
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
nmap <S-CR> i<CR><ESC>
nmap <Space><CR> o<ESC>

"edit mode keymap
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>

"folding the block
nnoremap <silent> zz :call FoldBlock()<CR>

function! FoldBlock()
  if foldclosed('.') != -1
    call feedkeys('za')
  else
    call feedkeys('zf%')
  endif
endfunction

silent! so ./.localvimrc
