map  <LEADER>v <C-v>
map g<Space> g<C-]>
map g<Tab> g<S-Space><C-w>T
map g<S-Space> :split<CR>g<C-]>
map g<S-CR> :vsplit<CR>g<C-]>

map ga :Alternate<CR>

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

function! ToggleTagList()
  let current_win = winnr()
  execute ":TlistToggle"
  execute current_win . " wincmd w"
endfunction


map <LEADER>6 :call ToggleDisableEnableMiniBufExplorer()<CR>
omap <silent> ic <Plug>CamelCaseMotion_iw
xmap <silent> ic <Plug>CamelCaseMotion_iw

map gw :Utl<CR>
autocmd FileType ruby setlocal iskeyword+=?
autocmd FileType ruby setlocal iskeyword+=!

let g:LargeFile = 3

" fancy pants moving block
vnoremap , :m'>+<CR>gv=gv
vnoremap . :m-2<CR>gv=gv

map @@ @q

" Taglist config
so $HOME/.vim/plugin/taglist.vim
:TlistAddFiles ./tags
let Tlist_Ctags_Cmd = '/opt/local/bin/ctags'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_Auto_Update = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 0
"let Tlist_Close_On_Select = 1
let Tlist_Use_Right_Window = 1

map <LEADER><LEADER> :CommandTFlush<CR>:CommandT<CR>
let g:CommandTCancelMap = '<SPACE>'
let g:CommandTSelectNextMap = "<Tab>"
let g:CommandTSelectPrevMap = "<S-Tab>"
let g:CommandTAcceptSelectionSplitMap = '<S-Space>'
let g:CommandTAcceptSelectionVSplitMap = '<S-CR>'

map <LEADER>e :call OpenFilesFromClipboard('e')<CR>

vmap <LEADER>nrw :Narrow<CR>
vmap <LEADER>wid :Widen<CR>

smap ' s'
smap " s"


silent! so ./.localvimrc
