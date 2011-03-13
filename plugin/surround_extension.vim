let g:bchars = ['[', ']', '(', ')', '{', '}', '"', "'", '<', '>']

function! ChangeSurroundInnerMostWithChar(char)
  let schar = FindInnerMostSurroundingChar()
  call ChangeSurround(schar, a:char)
endfunction

function! FindInnerMostSurroundingChar()
  let current_post = getpos('.')[2]
  let line = getline('.')

  let i = current_post
  while i > 0
    for bchar in g:bchars
      if line[i - 1] == bchar
        return bchar
      endif
    endfor

    let i = i - 1
  endwhile
endfunction


function! DeleleteInnerMostSurround()
  let schar = FindInnerMostSurroundingChar()
  call DeleteSurround(schar)
endfunction

function! DeleteSurround(char)
  call feedkeys("ds".a:char)
endfunction

function! ChangeSurround(original, new)
  call feedkeys("cs".a:original.a:new)
endfunction

for bchar in g:bchars
  if bchar == "'"
    execute 'nmap css'.bchar.' :call ChangeSurroundInnerMostWithChar("'.bchar.'")<CR>'
  else
    execute "nmap css".bchar." :call ChangeSurroundInnerMostWithChar('".bchar."')<CR>"
  endif
endfor

nmap <LEADER>'w viws'
nmap <LEADER>') vi)s'
nmap <LEADER>'} vi}s'
nmap <LEADER>'] vi]s'
nmap <LEADER>'( vi(s'
nmap <LEADER>'a vias'
nmap <LEADER>'' cs"'

nmap <LEADER>"w viws"
nmap <LEADER>") vi)s"
nmap <LEADER>"( vi(s"
nmap <LEADER>"} vi}s"
nmap <LEADER>"] vi]s"
nmap <LEADER>"a vias"
nmap <LEADER>"" cs'"
