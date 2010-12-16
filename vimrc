let mapleader = ' '
set nocompatible
set autowrite
set mouse=a 
set guioptions-=T
set guioptions-=L
set guioptions-=r
set go+=b
set guifont=Consolas:h16
set clipboard=unnamed

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set cindent
set smartindent
set autoindent
set foldmethod=syntax

silent! set macmeta
set splitright

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
set wildignore=.o,.obj,.git,*.swp,*.*~,*.gif,*.ico,*.jpg,vendor,*.class,*.gem,*.gz,dependencies,tmp

map  <LEADER>v <C-v>
map <S-Space> <ESC>:w<CR>

so $HOME/.vim/plugin/taglist.vim

if(has('gui'))
  :TlistAddFiles ./tags
endif

map <LEADER><LEADER> :CommandT<CR>
let g:CommandTCancelMap = '<SPACE>'
let g:CommandTSelectNextMap = "<Tab>"
let g:CommandTSelectPrevMap = "<S-Tab>"
let g:CommandTAcceptSelectionVSplitMap = '<S-CR>'

function! ToggleNERDTreeAndBufExplorer()
    exec ":NERDTreeToggle " . ProjectPathOf(g:current_project)
    exec ":TMiniBufExplorer"
endfunction

"show file drawer
map <LEADER>/ :call ToggleNERDTreeAndBufExplorer()<CR>
map <RightMouse> :call ToggleNERDTreeAndBufExplorer()<CR>

" Taglist config
map <Space>; :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
"project

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
" -------------------------------------------------------------------------------

map <D-w> :bd<CR>
imap <D-w> <ESC><D-w>

let inumber = 1

while inumber < 100
  execute "map  " . inumber . "<Space> " . ":call GotoBuffer(" . inumber . ")<CR>"
  let inumber = inumber + 1
endwhile
map 0<LEADER> :BufExplorer<CR><Down><CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-Tab> :BufExplorer<CR><Down><CR>
" searching
"--------------------------------------------------------------------
set hlsearch
set incsearch
set ignorecase
set smartcase
"-------------------------------------------------------------------------
vmap <LEADER>nrw :Narrow<CR>
vmap <LEADER>wid :Widen<CR>

" Open file from clipboard
map <LEADER>e :call OpenFilesFromClipboard('e')<CR>
" ------------------------------------------------------------------------
set visualbell    "don't beep
set noerrorbells  "dont beep
"------------------------------------------------------------------------
"no backup
set nobackup
set noswapfile
"-----------------------------------------------------------------------
"auto save
autocmd InsertLeave,FocusLost * :call Autosave()
function! Autosave ()
   if &modified
     silent! write
   endif
endfunction

vmap ' s'
vmap " s"
map <LEADER>' cs"'
map <LEADER>" cs'"

map <LEADER>,, ,c<SPACE>

"hightlight extra space
highlight ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
match ExtraWhitespace /[ \t]\+$/

"use sign for checking syntax
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

"better background
highlight Pmenu guibg=grey14 guifg=moccasin ctermbg=DarkGrey ctermfg=Black

map <LEADER>o :e<SPACE>
map <LEADER>n :n<SPACE>
map <Tab> :call NextBuffer()<CR>
map <S-Tab> :call PreviousBuffer()<CR>

"Tab in visual mode
  vmap <Tab> >
  vmap <S-Tab> <

"while border differenciate between j, k and gj, jk
map j gj
map k gk
"experiment of Marker plugin
map <SPACE>'' :ruby Marker.open()<CR>

"quicker autocomplete
set complete -=i

"enter new line without insert mode
map <LEADER><CR> o<ESC>
nmap <S-CR> i<CR><ESC>

"map Command J and command K
map <D-j> <C-d>
map <D-k> <C-u>
map <D-u> <C-e>
map <D-i> <C-y>

map <LEADER><CR> <C-w>w

"edit mode keymap
imap <C-SPACE> <C-x><C-o>
imap <S-Tab> <C-o>
imap <silent> <S-Space> <ESC>:w<CR>
imap <silent> <M-Space> <ESC>:w<CR>
imap <D-[> <ESC>lvBxi
imap <D-]> <ESC>lvExi
"quit the second window
map <LEADER>w :bd<CR>

"tryingout minibufexplorer
let g:miniBufExplVSplit = 25
let g:miniBufExplMinSize = 30
let g:miniBufExplMaxSize = 30

autocmd BufDelete * :UMiniBufExplorer
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplForceSyntaxEnable = 1
map <LEADER>W :TMiniBufExplorerCloseAllOthers<CR>

"folding the block
map zz za

silent! so ./.localvimrc
