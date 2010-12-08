syn match BufNumber             ':[0-9]*'
syn match MBENormal             '[^\]]*\*+\='
syn match MBEChanged            '[^\]]*+\*+\='
syn match MBEVisibleNormal      '[^\]]*\*+\='
syn match MBEVisibleChanged     '[^\]]*\*+\*+\='

syn match CucumberFileNormal      '[^\]]*\.feature+\='
syn match CucumberFileVisible     '[^\]]*\.feature\*+\='

syn match RubyFileNormal      '[^\]]*\.rb+\='
syn match RubyFileVisible     '[^\]]*\.rb\*+\='

syn match PerlFileNormal      '[^\]]*\.pm+\='
syn match PerlFileVisible     '[^\]]*\.pm\*+\='

syn match PerlPlFileNormal      '[^\]]*\.pl+\='
syn match PerlPlFileVisible     '[^\]]*\.pl\*+\='

syn match PerlTestFileNormal      '[^\]]*\.t+\='
syn match PerlTestFileVisible     '[^\]]*\.t\*+\='

syn match HtmlFileNormal      '[^\]]*\.html+\='
syn match HtmlFileVisible     '[^\]]*\.html\*+\='

syn match HamlFileNormal      '[^\]]*\.haml+\='
syn match HamlFileVisible     '[^\]]*\.haml\*+\='

syn match SassFileNormal      '[^\]]*\.scss+\='
syn match SassFileVisible     '[^\]]*\.scss\*+\='

syn match VpkFileNormal      '[^\]]*\.vpk+\='
syn match VpkFileVisible     '[^\]]*\.vpk\*+\='

hi HiddenBufNumber guifg=Black guibg=Black ctermfg=Black ctermbg=Black
hi SelectedBuffer gui=underline guibg=grey20 cterm=underline
hi ChangedBuffer guifg=Yellow ctermfg=Yellow
hi SelectedChangedBuffer  ctermfg=Yellow ctermbg=White cterm=underline
hi NormalBuffer guifg=White ctermfg=White

" cucumber hightlight
hi CucumberNormalHighlight guifg=Green ctermfg=Green
hi CucumberVisibleHighlight guifg=Green ctermfg=Green gui=underline cterm=underline
" ruby highlight
hi RubyNormalHighlight guifg=IndianRed ctermfg=Red
hi RubyVisibleHighlight guifg=IndianRed ctermfg=Red gui=underline cterm=underline
" perl highlight
hi PerlNormalHighlight guifg=SandyBrown ctermfg=Yellow
hi PerlVisibleHighlight guifg=SandyBrown ctermfg=Yellow gui=underline cterm=underline
" perl test highlight
hi PerlTestNormalHighlight guifg=sienna ctermfg=Yellow
hi PerlTestVisibleHighlight guifg=sienna ctermfg=Yellow gui=underline cterm=underline
"html highlight
hi HtmlNormalHighlight guifg=LightBlue ctermfg=Blue
hi HtmlVisibleHighlight guifg=LightBlue ctermfg=blue gui=underline cterm=underline
"haml highlight
hi HamlNormalHighlight guifg=OrangeRed ctermfg=196
hi HamlVisibleHighlight guifg=OrangeRed ctermfg=196 gui=underline cterm=underline
"sass highlight
hi SassNormalHighlight guifg=Orchid ctermfg=207
hi SassVisibleHighlight guifg=Orchid ctermfg=207 gui=underline cterm=underline
"vpk highlight
hi VpkNormalHighlight guifg=turquoise ctermfg=123
hi VpkVisibleHighlight guifg=turquoise ctermfg=123 gui=underline cterm=underline

"apply cucumber hightlight
hi def link CucumberFileVisible CucumberVisibleHighlight
hi def link CucumberFileNormal CucumberNormalHighlight
"apply ruby hightlight
hi def link RubyFileVisible RubyVisibleHighlight
hi def link RubyFileNormal RubyNormalHighlight
"apply perl hightlight
hi def link PerlFileVisible PerlVisibleHighlight
hi def link PerlFileNormal PerlNormalHighlight
"apply perl pl hightlight
hi def link PerlPlFileVisible PerlVisibleHighlight
hi def link PerlPlFileNormal PerlNormalHighlight
"apply perl test hightlight
hi def link PerlTestFileVisible PerlTestVisibleHighlight
hi def link PerlTestFileNormal PerlTestNormalHighlight
"apply html hightlight
hi def link HtmlFileVisible HtmlVisibleHighlight
hi def link HtmlFileNormal HtmlNormalHighlight
"apply haml hightlight
hi def link HamlFileVisible HamlVisibleHighlight
hi def link HamlFileNormal HamlNormalHighlight
"apply sass hightlight
hi def link SassFileVisible SassVisibleHighlight
hi def link SassFileNormal SassNormalHighlight
"apply vpk hightlight
hi def link VpkFileVisible VpkVisibleHighlight
hi def link VpkFileNormal VpkNormalHighlight

hi def link BufNumber  HiddenBufNumber
hi def link MBEVisibleNormal  SelectedBuffer
hi def link MBENormal  NormalBuffer
hi def link MBEChanged        ChangedBuffer
hi def link MBEVisibleChanged SelectedChangedBuffer
