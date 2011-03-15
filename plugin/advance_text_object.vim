function! FindPrevious(char)
  let current = getpos('.')[2]

  while current > 1
    if getline('.')[current - 1] == a:char
      return current
    endif
    let current = current - 1
  endwhile
endfunction

function! FindForward(char)
  let current = getpos('.')[2]

  while current < strlen(getline('.'))
    if getline('.')[current - 1] == a:char
      return current
    endif
    let current = current + 1
  endwhile
endfunction

function! SelectPrevious(selection, char)
  let position = FindPrevious(a:char)
  if position
    call feedkeys(position.'|v'.a:selection.a:char)
  endif
endfunction

function! SelectForward(selection, char)
  let position = FindForward(a:char)
  if position
    call feedkeys(position.'|v'.a:selection.a:char)
  endif
endfunction

vmap ihb <ESC>:call SelectPrevious('i', ')')<CR>
omap ihb :normal vihb<CR>
vmap ahb <ESC>:call SelectPrevious('a', ')')<CR>
omap ahb :normal vahb<CR>
vmap ilb <ESC>:call SelectForward('i', '(')<CR>
omap ilb :normal vilb<CR>
vmap alb <ESC>:call SelectForward('a', '(')<CR>
omap alb :normal valb<CR>

vmap ihB <ESC>:call SelectPrevious('i', '}')<CR>
omap ihB :normal vihB<CR>
vmap ahB <ESC>:call SelectPrevious('a', '}')<CR>
omap ahB :normal vahB<CR>
vmap ilB <ESC>:call SelectForward('i', '{')<CR>
omap ilB :normal vilB<CR>
vmap alB <ESC>:call SelectForward('a', '{')<CR>
omap alB :normal valB<CR>

vmap ih' <ESC>:call SelectPrevious('i', "'")<CR>
omap ih' :normal vih'<CR>
vmap ah' <ESC>:call SelectPrevious('a', "'")<CR>
omap ah' :normal vah'<CR>
vmap il' <ESC>:call SelectForward('i', "'")<CR>
omap il' :normal vil'<CR>
vmap al' <ESC>:call SelectForward('a', "'")<CR>
omap al' :normal val'<CR>

let list = ['(', ')', '{', '}', ']', '[','"', '`', '<', '>', ',', ':', '-']

for char in list
  execute "vmap ih".char." <ESC>:call SelectPrevious('i', '".char."')<CR>"
  execute "omap ih".char." :normal vih".char."<CR>"
  execute "vmap ah".char." <ESC>:call SelectPrevious('a', '".char."')<CR>"
  execute "omap ah".char." :normal vah".char."<CR>"

  execute "vmap il".char." <ESC>:call SelectForward('i', '".char."')<CR>"
  execute "omap il".char." :normal vil".char."<CR>"
  execute "vmap al".char." <ESC>:call SelectForward('a', '".char."')<CR>"
  execute "omap al".char." :normal val".char."<CR>"
endfor
