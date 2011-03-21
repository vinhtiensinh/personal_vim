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

function! SurroundTextObject(select)
  if CountCharOnLine('(') > 1
    " do nothing
  elseif SinglePair('(', ')')
    call SmartTextObject(a:select, '(')
  elseif CountCharOnLine('{') > 1
    " do nothing
  elseif SinglePair('{', '}')
    call SmartTextObject(a:select, '{')
  elseif CountCharOnLine('[') > 1
    " do nothing
  elseif SinglePair('[', ']')
    call SmartTextObject(a:select, '[')
  elseif CountCharOnLine('<') > 1
    " do nothing
  elseif SinglePair('<', '>')
    call SmartTextObject(a:select, '<')
  endif
endfunction

function! QuoteTextObject(select)
  if NoSinglePairQuote_or_TooManyQuote("'")
    " do nothing
  elseif SinglePairQuote("'")
    call SmartTextObject(a:select, "'")
  elseif NoSinglePairQuote_or_TooManyQuote('"')
    " do nothing
  elseif SinglePairQuote('"')
    call SmartTextObject(a:select, '"')
  elseif NoSinglePairQuote_or_TooManyQuote('`')
    " do nothing
  elseif SinglePairQuote('`')
    call SmartTextObject(a:select, '`')
  endif
endfunction

function! NoSinglePairQuote_or_TooManyQuote(char)
  return CountCharOnLine(a:char) > 2 || CountCharOnLine(a:char) == 1
endfunction

function! SinglePairQuote(char)
  return CountCharOnLine(a:char) == 2
endfunction

function! SinglePair(begin, end)
  return CountCharOnLine(a:begin) == 1 &&
        \CountCharOnLine(a:end) == 1 &&
        \FindFirstPositionOf(a:begin) < FindFirstPositionOf(a:end)
endfunction

vmap io <ESC>:call SetCurrentSelection('vis')<CR>:call SurroundTextObject('i')<CR>
vmap ao <ESC>:call SetCurrentSelection('vas')<CR><ESC>:call SurroundTextObject('a')<CR>
omap io :normal vis<CR>
omap ao :normal vas<CR>
vmap iq <ESC>:call SetCurrentSelection('viq')<CR>:call QuoteTextObject('i')<CR>
vmap aq <ESC>:call SetCurrentSelection('viq')<CR>:call QuoteTextObject('a')<CR>
omap iq :normal viq<CR>
omap aq :normal vaq<CR>

vmap ihb <ESC>:call SetCurrentSelection('vihb')<CR>:call SelectPrevious('i', ')')<CR>
vmap ahb <ESC>:call SetCurrentSelection('vahb')<CR>:call SelectPrevious('a', ')')<CR>
omap ihb :normal vihb<CR>
omap ahb :normal vahb<CR>
vmap ilb <ESC>:call SetCurrentSelection('vilb')<CR>:call SelectForward('i', '(')<CR>
vmap alb <ESC>:call SetCurrentSelection('valb')<CR>:call SelectForward('a', '(')<CR>
omap ilb :normal vilb<CR>
omap alb :normal valb<CR>

vmap ihB <ESC>:call SetCurrentSelection('vihB')<CR>:call SelectPrevious('i', '}')<CR>
vmap ahB <ESC>:call SetCurrentSelection('vihB')<CR>:call SelectPrevious('a', '}')<CR>
omap ihB :normal vihB<CR>
omap ahB :normal vahB<CR>
vmap ilB <ESC>:call SetCurrentSelection('ilB')<CR>:call SelectForward('i', '{')<CR>
vmap alB <ESC>:call SetCurrentSelection('alB')<CR>:call SelectForward('a', '{')<CR>
omap ilB :normal vilB<CR>
omap alB :normal valB<CR>

vmap ih' <ESC>:call SetCurrentSelection("vih'")<CR>:call SelectPrevious('i', "'")<CR>
vmap ah' <ESC>:call SetCurrentSelection("vah'")<CR>:call SelectPrevious('a', "'")<CR>
omap ih' :normal vih'<CR>
omap ah' :normal vah'<CR>
vmap il' <ESC>:call SetCurrentSelection("vil'")<CR>:call SelectForward('i', "'")<CR>
vmap al' <ESC>:call SetCurrentSelection("val'")<CR>:call SelectForward('a', "'")<CR>
omap il' :normal vil'<CR>
omap al' :normal val'<CR>

let list = ['(', ')', '{', '}', ']', '[','"', '`', '<', '>', ',', ':', '-']

for char in list
  execute "vmap ih".char." <ESC>:call SetCurrentSelection('vih".char."')<CR>:call SelectPrevious('i', '".char."')<CR>"
  execute "vmap ah".char." <ESC>:call SetCurrentSelection('vah".char."')<CR>:call SelectPrevious('a', '".char."')<CR>"
  execute "omap ih".char." :normal vih".char."<CR>"
  execute "omap ah".char." :normal vah".char."<CR>"

  execute "vmap il".char." <ESC>:call SetCurrentSelection('vil".char."')<CR>:call SelectForward('i', '".char."')<CR>"
  execute "vmap al".char." <ESC>:call SetCurrentSelection('val".char."')<CR>:call SelectForward('a', '".char."')<CR>"
  execute "omap il".char." :normal vil".char."<CR>"
  execute "omap al".char." :normal val".char."<CR>"
endfor
