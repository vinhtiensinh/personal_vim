let b:refactor_variable_declaration = ''
let b:refactor_statement_delimeter = ''
let b:refactor_method_declaration_start = ''
let b:refactor_method_declaration_end = ''

autocmd FileType ruby let b:refactor_method_declaration_start = 'def'
autocmd FileType ruby let b:refactor_method_declaration_end = 'end'

function! ExtractVariable()
  let variable_name = input('variable name: ')
  call feedkeys('gv"rygvc')
  call feedkeys(variable_name)
  call feedkeys("\<ESC>")
  let variable_declaration = variable_name." = ".@r
  call feedkeys('O'.variable_declaration."\<ESC>==")
endfunction


function! ExtractMethod()
  let method_name = input('method name: ')
  call feedkeys('gv"rygvc')
  call feedkeys(method_name)
  call feedkeys("\<ESC>")
  let method_declaration = b:refactor_method_declaration_start .' '. method_name."\n".@r.b:refactor_method_declaration_end
  call feedkeys("]mO\<CR>\<ESC>ki".method_declaration."\<ESC>")
  call feedkeys("'[v']=")
endfunction
