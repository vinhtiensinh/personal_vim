function! RunSingleTest()
  let test = expand('%') . ':'. line('.')
  if test  =~ '\.feature' || test =~ '\.story'
    let test_cmd = 'cucumber '
  elseif test =~ '_spec'
    let test_cmd = 'spec '
  elseif test =~ '.t'
    let test_cmd = 'perl '
  endif

  execute 'ConqueTermVSplit ' . test_cmd . test
endfunction

function! RunSingleTestFile()
  let test = expand('%')
  if test  =~ '\.feature' || test =~ '\.story'
    let test_cmd = 'cucumber '
  elseif test =~ '_spec'
    let test_cmd = 'spec '
  elseif test =~ '.t'
    let test_cmd = 'perl '
  endif

  execute 'ConqueTermVSplit ' . test_cmd . test
endfunction

function! RunAllTests()
  let test = expand('%')
  if test  =~ '\.feature' || test =~ '\.story'
    let test_cmd = 'cucumber features/'
  elseif test =~ '_spec'
    let test_cmd = 'spec spec/'
  elseif test =~ '.t'
    let test_cmd = 'prove t/*.t'
  endif

  execute 'ConqueTermVSplit ' . test_cmd
endfunction
