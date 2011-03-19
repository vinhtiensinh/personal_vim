function! FindPrevious(char)
  let current = getpos('.')[2]

  while current >= 1
    if getline('.')[current - 1] == a:char
      return current
    endif
    let current = current - 1
  endwhile
endfunction

function! FindForward(char)
  let current = getpos('.')[2]

  while current <= strlen(getline('.'))
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

function! CountCharOnLine(char)
  let i = 0
  let icount = 0
  while i < strlen(getline('.'))
    if getline('.')[i] == a:char
      let icount = icount + 1
    endif

    let i = i + 1
  endwhile

  return icount 
endfunction

function! FindFirstPositionOf(char)
  let i = 0
  while i < strlen(getline('.'))
    if getline('.')[i] == a:char
      return i + 1
    endif

    let i = i + 1
  endwhile
endfunction

function! SmartTextObject(select, char)
  let single_possibility = 2 

  let pairs = ['{', '}', '(', ')', '[', ']', '<', '>']
  for char in pairs
    if char == a:char
      let single_possibility = 1
    endif
  endfor
  
  if CountCharOnLine(a:char) > single_possibility 
    execute ":normal! v" . a:select . a:char
  elseif FindFirstPositionOf(a:char) < getpos('.')[2]
    call feedkeys('v' . a:select . 'h' . a:char)
  elseif FindFirstPositionOf(a:char) > getpos('.')[2]
    call feedkeys('v'. a:select . 'l' . a:char)
  else
    execute ":normal! v" . a:select . a:char
  endif
endfunction

vmap ib <ESC>:call SmartTextObject('i', '(')<CR>
vmap ab <ESC>:call SmartTextObject('a', '(')<CR>
omap ib :normal vib<CR>
omap ab :normal vab<CR>
vmap iB <ESC>:call SmartTextObject('i', '{')<CR>
vmap aB <ESC>:call SmartTextObject('a', '{')<CR>
omap iB :normal viB<CR>
omap aB :normal vaB<CR>
vmap i' <ESC>:call SmartTextObject("i", "'")<CR>
vmap a' <ESC>:call SmartTextObject("a", "'")<CR>
omap i' :normal vi'<CR>
omap a' :normal va'<CR>

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
  execute "vmap i".char. " <ESC>:call SmartTextObject('i', '".char."')<CR>"
  execute "vmap a".char. " <ESC>:call SmartTextObject('a', '".char."')<CR>"
  execute "omap i".char. " :normal vi".char."<CR>"
  execute "omap a".char. " :normal va".char."<CR>"

  execute "vmap ih".char." <ESC>:call SelectPrevious('i', '".char."')<CR>"
  execute "omap ih".char." :normal vih".char."<CR>"
  execute "vmap ah".char." <ESC>:call SelectPrevious('a', '".char."')<CR>"
  execute "omap ah".char." :normal vah".char."<CR>"

  execute "vmap il".char." <ESC>:call SelectForward('i', '".char."')<CR>"
  execute "omap il".char." :normal vil".char."<CR>"
  execute "vmap al".char." <ESC>:call SelectForward('a', '".char."')<CR>"
  execute "omap al".char." :normal val".char."<CR>"
endfor
