syn match BufNumber             ':[0-9]*'
syn match MBENormal             '[^\]]*\*+\='
syn match MBEChanged            '[^\]]*+\*+\='
syn match MBEVisibleNormal      '[^\]]*\*+\='
syn match MBEVisibleChanged     '[^\]]*\*+\*+\='

hi HiddenBufNumber guifg=Black guibg=Black ctermfg=Black ctermbg=Black
hi SelectedBuffer gui=underline guibg=grey20 cterm=underline
hi ChangedBuffer guifg=Yellow ctermfg=Yellow
hi SelectedChangedBuffer  ctermfg=Yellow ctermbg=White cterm=underline
hi NormalBuffer guifg=White ctermfg=White

hi def link BufNumber  HiddenBufNumber
hi def link MBEVisibleNormal  SelectedBuffer
hi def link MBENormal  NormalBuffer
hi def link MBEChanged        ChangedBuffer
hi def link MBEVisibleChanged SelectedChangedBuffer

let file_types = [
      \ ['PerlTest', '[^\]]*\.t+\=', '[^\]]*\.t\*+\=', 'sienna', 'Yellow'],
      \ ['Todo', '[^\]]*\.todo+\=', '[^\]]*\.todo\*+\=', 'Red', 'Red'],
      \ ['Cucumber', '[^\]]*\.feature+\=', '[^\]]*\.feature\*+\=', 'Green', 'Green'],
      \ ['Ruby', '[^\]]*\.rb+\=', '[^\]]*\.rb\*+\=', 'Red', 'Red'],
      \ ['Perl', '[^\]]*\.pm+\=', '[^\]]*\.pm\*+\=', 'SandyBrown', 'Yellow'],
      \ ['Html', '[^\]]*\.html+\=', '[^\]]*\.html\*+\=', 'LightBlue', 'Blue'],
      \ ['Haml', '[^\]]*\.haml+\=', '[^\]]*\.haml\*+\=', 'OrangeRed', '196'],
      \ ['Sass', '[^\]]*\.scss+\=', '[^\]]*\.scss\*+\=', 'Orchid', '207'],
      \ ['Vpk', '[^\]]*\.vpk+\=', '[^\]]*\.vpk\*+\=', 'turquoise', '123'],
      \ ['Vim', '[^\]]*\.vim+\=', '[^\]]*\.vim\*+\=', 'turquoise', '123'],
\ ]

for file_type in file_types
  let name              = file_type[0]
  let match_normal      = file_type[1]
  let match_visual      = file_type[2]
  let guifg             = file_type[3]
  let ctermfg           = file_type[4]
  let normal_id         = name."FileNormal"
  let visual_id         = name."FileVisible"
  let normal_highlight  = name."NormalHighlight"
  let visual_hightlight = name."VisibleHighlight"

  execute 'syn match '.normal_id." '".match_normal."'"
  execute 'syn match '.visual_id." '".match_visual."'"

  execute 'hi '.normal_highlight.' guifg='.guifg.' ctermfg='.ctermfg
  execute 'hi '.visual_hightlight.'  guifg=' . guifg.' ctermfg='.ctermfg.' gui=underline cterm=underline'
  execute 'hi def link '.visual_id.' '.visual_hightlight
  execute 'hi def link '.normal_id.' '.normal_highlight
endfor
