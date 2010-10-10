function! StepFileRecommendations()
  let g:rea_current_undef_step = getline('.')
  let recommendation = system("step_recommendation.rb '" . getline('.') . "'")
  
  execute 'vsplit __Step_Files__' 
  silent put = recommendation
  set buftype=nofile
  map <buffer> j <Down>:call InspectStepFile()<CR>
  map <buffer> k <Up>:call InspectStepFile()<CR>
  map <buffer> <CR> :call AddNewStep()<CR>
  map <buffer> <ESC> :bwipe<CR>
  map <buffer> :q :bwipe
  autocmd  BufUnload __Step_Files__ execute ':silent! bwipe __Step_definitions.feature'
  execute '1'
  execute 'd'
  call InspectStepFile()
endfunction

function! AddNewStep()
  execute 'vsplit ' . getline('.') 
  execute ':bwipe __Step_definitions.feature'
  execute ':bwipe __Step_Files__' 
  let step_definition = system("step_conversion.rb '" . g:rea_current_undef_step . "'")
  call append(line("$"), ['', step_definition, 'end'])
  execute '$'
  call feedkeys('o')
endfunction

function! InspectStepFile()
  let recommendation = system("step_definitions.rb '" . getline('.') . "'")
  
  if bufexists('__Step_definitions.feature')
    execute ':bwipe __Step_definitions.feature'
  endif

  execute 'bel split __Step_definitions.feature' 
  silent put = recommendation
  set buftype=nofile
  call feedkeys("\<C-w>k") 

endfunction

function! OpenGizmoPage()

  let current_line_number = line('.')
  let page   = ''
  let method = ''
  let current_line = getline(current_line_number)

  while current_line_number > 0
    let current_line        = getline(current_line_number)
    let current_line_number = current_line_number - 1

    if method == '' && current_line =~ 'page\.\w'
      let method = split(matchstr(current_line, 'page\.\w\+'), '\.')[1]
      if method == 'perform'
        let method = 'define_action\s\+' . matchstr(current_line, ':\w\+')
      else
        let method = 'def\s\+' . method
      end
      continue
    elseif page == '' && current_line =~ 'on_page_with\s\+:\w\+'
      let page   = split(matchstr(current_line, 'on_page_with\s\+:\w\+'), '\:')[1]
      break
    endif
  endwhile

  if page == ''
    echo "Cannot find gizmo page"
  else
    execute 'tabnew features/support/pages/page_with_' . page . '.rb'
  endif

  if method != ''
    silent execute '/' . method
  endif

endfunction
