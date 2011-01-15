if exists("b:current_syntax")
  finish
endif

syntax match TagListComment '^" .*'
syntax match TagListFileName '^[^" ].*$'
syntax match TagListTitle '^  \S.*$'
syntax match TagListTagScope  '\s\[.\{-\}\]$'

hi def link TagListComment Comment
hi def link TagListTitle   Title
hi def link TagListTagScope Identifier
hi def link TagListFileName Constant
hi def link TagListTagName Statement
