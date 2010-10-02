" Vim filetype plugin
" Language:	Cucumber
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1
sign define fixme text=!! linehl=Todo
function! CheckLineStepDefinition()
  let line_nr = line('.') 

  let current_line = getline(line_nr)
  if (( current_line =~ '\s\+Given\s') || (current_line =~ '\s\+And\s') || (current_line =~ '\s\+When\s') || (current_line =~ '\s\+Then\s'))
    if len(s:steps(line_nr)) == 0
      execute ":sign place ".line_nr." line=".line_nr." name=fixme file=".expand("%:p")
    else
      execute ":sign unplace " . line_nr
    endif
  endif
endfunction

function! CheckFileStepDefinition()
  call feedkeys('G')

  let line_nr = line('.')

  while line_nr > 0

    let current_line = getline(line_nr)
    let all_steps = s:allsteps()

    if (( current_line =~ '\s\+Given\s') || (current_line =~ '\s\+And\s') || (current_line =~ '\s\+When\s') || (current_line =~ '\s\+Then\s'))

      let c = indent(line_nr) + 1
      while synIDattr(synID(line_nr,c,1),'name') !~# '^$\|Region$'
        let c = c + 1
      endwhile

      let tmp_all_steps = all_steps
      let step = matchstr(getline(line_nr)[c-1 : -1],'^\s*\zs.\{-\}\ze\s*$')
      let step_defined = 0

      for tmp_step in all_steps
        if s:stepmatch(tmp_step[3], step)
          let step_defined = 1
          break
        endif
      endfor

      if step_defined == 0
        execute ":sign place ".line_nr." line=".line_nr." name=fixme file=".expand("%:p")
      else
        execute ":sign unplace " . line_nr
      endif

    endif

    let line_nr = line_nr - 1
  endwhile

endfunction

setlocal formatoptions-=t formatoptions+=croql
setlocal comments=:# commentstring=#\ %s
setlocal omnifunc=CucumberComplete

let b:undo_ftplugin = "setl fo< com< cms< ofu<"

let b:cucumber_root = expand('%:p:h:s?.*[\/]\%(features\|stories\)\zs[\/].*??')

if !exists("g:no_plugin_maps") && !exists("g:no_cucumber_maps")
  nmap <silent><buffer> <C-t>       :<C-U>exe <SID>jump('tabnew',v:count)<CR>
  nmap <silent><buffer> <C-]>       :<C-U>exe <SID>jump('edit',v:count)<CR>
  nmap <silent><buffer> <C-W>]      :<C-U>exe <SID>jump('split',v:count)<CR>
  nmap <silent><buffer> <C-W><C-]>  :<C-U>exe <SID>jump('split',v:count)<CR>
  nmap <silent><buffer> <C-W>}      :<C-U>exe <SID>jump('pedit',v:count)<CR>
  let b:undo_ftplugin .= "| sil! iunmap! <C-]>| sil! iunmap! <C-W>]| sil! iunmap! <C-W><C-]>| sil! iunmap! <C-W>}"
endif

function! s:jump(command,count)
  let steps = s:steps('.')
  if len(steps) == 0 || len(steps) < a:count
    return 'echoerr "No matching step found"'
  elseif len(steps) > 1 && !a:count
    return 'echoerr "Multiple matching steps found"'
  else
    let c = a:count ? a:count-1 : 0
    return a:command.' +'.steps[c][1].' '.escape(steps[c][0],' %#')
  endif
endfunction

function! s:allsteps()
  let step_pattern = '\C^\s*\K\k*\>\s*\zs\S.\{-\}\ze\s*\%(do\|{\)\s*\%(|[^|]*|\s*\)\=\%($\|#\)'
  let steps = []
  for file in split(glob(b:cucumber_root.'/**/*.rb'),"\n")
    let lines = readfile(file)
    let num = 0
    for line in lines
      let num += 1
      if line =~ step_pattern
        let type = matchstr(line,'\w\+')
        let steps += [[file,num,type,matchstr(line,step_pattern)]]
      endif
    endfor
  endfor
  return steps
endfunction

function! s:steps(lnum)
  let c = indent(a:lnum) + 1
  while synIDattr(synID(a:lnum,c,1),'name') !~# '^$\|Region$'
    let c = c + 1
  endwhile
  let step = matchstr(getline(a:lnum)[c-1 : -1],'^\s*\zs.\{-\}\ze\s*$')
  return filter(s:allsteps(),'s:stepmatch(v:val[3],step)')
endfunction

function! s:stepmatch(receiver,target)
  if a:receiver =~ '^[''"].*[''"]$'
    let pattern = '^'.escape(substitute(a:receiver[1:-2],'$\w\+','(.*)','g'),'/').'$'
  elseif a:receiver =~ '^/.*/$'
    let pattern = a:receiver[1:-2]
  elseif a:receiver =~ '^%r..*.$'
    let pattern = escape(a:receiver[3:-2],'/')
  else
    return 0
  endif

  ruby VIM.command("return #{if (begin; Kernel.eval('/'+VIM.evaluate('pattern')+'/'); rescue SyntaxError; end) === VIM.evaluate('a:target') then 1 else 0 end}")
endfunction

function! s:bsub(target,pattern,replacement)
  return  substitute(a:target,'\C\\\@<!'.a:pattern,a:replacement,'g')
endfunction

function! CucumberComplete(findstart,base) abort
  let indent = indent('.')
  let group = synIDattr(synID(line('.'),indent+1,1),'name')
  let type = matchstr(group,'\Ccucumber\zs\%(Given\|When\|Then\)')
  let e = matchend(getline('.'),'^\s*\S\+\s')
  if type == '' || col('.') < col('$') || e < 0
    return -1
  endif
  if a:findstart
    return e
  endif
  let steps = []
  for step in s:allsteps()
    if step[2] ==# type
      if step[3] =~ '^[''"]'
        let steps += [step[3][1:-2]]
      elseif step[3] =~ '^/\^.*\$/$'
        let pattern = step[3][2:-3]
        let pattern = substitute(pattern,'\C^(?:|I )','I ','')
        let pattern = s:bsub(pattern,'\\[Sw]','w')
        let pattern = s:bsub(pattern,'\\d','1')
        let pattern = s:bsub(pattern,'\\[sWD]',' ')
        let pattern = s:bsub(pattern,'\[\^\\\="\]','_')
        let pattern = s:bsub(pattern,'[[:alnum:]. _-][?*]?\=','')
        let pattern = s:bsub(pattern,'\[\([^^]\).\{-\}\]','\1')
        let pattern = s:bsub(pattern,'+?\=','')
        let pattern = s:bsub(pattern,'(\([[:alnum:]. -]\{-\}\))','\1')
        let pattern = s:bsub(pattern,'\\\([[:punct:]]\)','\1')
        if pattern !~ '[\\()*?]'
          let steps += [pattern]
        endif
      endif
    endif
  endfor
  call filter(steps,'s:filterstep(v:val,a:base)')
  return s:sortsteps(steps,a:base)
endfunction

function! s:filterstep(receiver,target)
  for word in split(a:target," ")
    if a:receiver !~ word
      return 0 
    endif
  endfor
  return 1 
endfunction

function! s:sortsteps(steps, base)
  let words = ""
  let index = 0
  for word in split(a:base, " ")
    if words ==# ""
      let words = word
    else
      let words = words . " " . word
    endif

    let stepindex = 0
    for step in a:steps
      if step =~ words
        let tmpstep = a:steps[0]
        let a:steps[0] = a:steps[stepindex]
        let a:steps[stepindex] = tmpstep
      endif
      let stepindex += 1
    endfor
    let index += 1
  endfor
  return a:steps
endfunction
" vim:set sts=2 sw=2:
