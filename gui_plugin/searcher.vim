if !has('ruby')
  finish
endif


function! SearchWeb()

  let l:save_reg = @"
  let @" = ""
  normal! ""y

  call system("/Applications/Firefox.app/Contents/MacOS/firefox-bin --remote
        \ http://google.com/search?".l:save_reg)

endfunction

function! SearcherGrep(options, path, string)
  let path = a:path
  let string = a:string

  if empty(a:string)
    let string = expand('<cword>')
  endif

  if empty(a:path)
    let path = input('grep -' . a:options . " '" . string . "' " . '<where ?>: ', "", "file")
  endif

  if empty(path)
    return
  endif

  execute  'ruby ' . "Searcher.grep('" . a:options . "','" . path . "','" . string . "')"

endfunction

function! SearcherGrepCmd()

  let input = input('grep: ', '', 'file')
  if empty(input)
    return
  endif
  let parts = split(input, "'")
  execute  'ruby ' . "Searcher.grep('" . parts[0] . "','" . parts[2] . "','" . parts[1] . "')"

endfunction

function! SearcherGrepRinCmd()

  let iinput = input('grep -rin: ', '')
  if empty(iinput)
    return
  endif
  let string = iinput

  let iinput = input('location: ', '', 'file')
  if empty(iinput)
    return
  endif

  let location = iinput
  execute  'ruby ' . "Searcher.grep('-rin','" . location . "','" .  string . "')"

endfunction

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/ruby-search")
      require "#{path}/ruby/ruby-search/searcher.rb"
    end
  end
EOF
