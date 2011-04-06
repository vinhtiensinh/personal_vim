function! ExtractVariable()
  let variable_name = input('variable name: ')
  call feedkeys('gv"rygvc')
  call feedkeys(variable_name)
  call feedkeys("\<ESC>")
  let variable_declaration = variable_name." = ".@r
  call feedkeys('O'.variable_declaration."\<ESC>==")
endfunction
