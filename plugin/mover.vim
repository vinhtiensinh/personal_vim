function! Move(percentage)
  let iline = getline('.')
  let length = len(iline)

  let pos = (length*a:percentage)/100
  call feedkeys(float2nr(pos) . '|B')

endfunction

let moves = []
let moves += [['a', 5]]
let moves += [['s', 15]]
let moves += [['d', 25]]
let moves += [['f', 35]]
let moves += [['g', 45]]
let moves += [['h', 55]]
let moves += [['j', 65]]
let moves += [['k', 75]]
let moves += [['l', 85]]
let moves += [[';', 95]]

for imove in moves
  execute 'map <LEADER>m' . imove[0] . ' ' . ':call Move(' . imove[1] . ')<CR>'
endfor
