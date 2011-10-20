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
set number

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
set wildignore=.o,.obj,.git,*.swp,*.*~,*.gif,*.png,*.ico,*.jpg,*.class,*.gem,*.gz,dependencies,tmp,_build,cover_db,public/stylesheets/*.css

map  <LEADER>v <C-v>

map g<Space> g<C-]>
map g<Tab> g<S-Space><C-w>T
map g<S-Space> :split<CR>g<C-]>
map g<S-CR> :vsplit<CR>g<C-]>

map ga :Alternate<CR>

nmap yl ^v$hy
nmap dl ^v$hd
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

map <LEADER>3 \c<SPACE>

"hightlight extra space
highlight ExtraWhitespace ctermbg=DarkGrey guibg=DarkGrey
match ExtraWhitespace /[ \t]\+$/
"better background
highlight Pmenu guibg=grey14 guifg=moccasin ctermbg=DarkGrey ctermfg=Black

map <LEADER>o :e<SPACE>
map <LEADER>n :n<SPACE>

"splitjoin
nmap <Leader>- :SplitjoinJoin<cr>
nmap <Leader>= :SplitjoinSplit<cr>
let g:splitjoin_ruby_curly_braces = 0

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
imap <ESC> <ESC>:w<CR>
vmap <ESC> <ESC>:w<CR>
smap <ESC> <ESC>:w<CR>

"close surrounding windows
map <LEADER>H <C-w>h:q<CR>
map <LEADER>J <C-w>j:q<CR>
map <LEADER>K <C-w>k:q<CR>
map <LEADER>L <C-w>l:q<CR>


nmap <Tab> :call NextBuffer()<CR>
nmap <S-Tab> :call PreviousBuffer()<CR>

"tryingout minibufexplorer
let g:miniBufExplVSplit = 25
let g:miniBufExplMinSize = 31
let g:miniBufExplMaxSize = 31
"let g:miniBufExplAutoClose = 1

let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplorerMoreThanOne = 3
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplUseSingleClick = 1
"nerd tree
let g:NERDTreeMapOpenSplit = '<S-Space>'
let g:NERDTreeMapOpenVSplit = '<S-CR>'
let g:NERDTreeWinSize = 31

"light house
autocmd VimEnter * call SwitchToProject()
autocmd TabEnter * execute ":UMiniBufExplorer"
map <LEADER>W :TMiniBufExplorerCloseAllOthers<CR>
map <C-1> :call ToggleBetweenNERDTreeAndBufExplorer()<CR>
map <C-!> :call CloseNERDTreeAndBufExplorer()<CR>
map gt :call GTTabMove('next')<CR>
map gT :call GTTabMove('previous')<CR>
function! GTTabMove(direction)
  if IsBufExplorerOpen() && tabpagenr('$') == 1
    if a:direction == 'next'
      call NextBuffer()
    else
      call PreviousBuffer()
    endif
  elseif a:direction == 'next'
    normal! gt
  else
    normal! gT
  endif

endfunction

"string to symbol"
map <LEADER>2s ds'i:<ESC>

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
autocmd FileType ruby setlocal iskeyword+=?
autocmd FileType ruby setlocal iskeyword+=!

let g:LargeFile = 3

" fancy pants moving block
vnoremap , :m'>+<CR>gv=gv
vnoremap . :m-2<CR>gv=gv

let g:SuperTabCrMapping = 0

map @@ @q

silent! so ./.localvimrc

