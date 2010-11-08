if !has('ruby')
  finish
endif

function! GrepperGrep(options, path, string)
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

  execute  'ruby ' . "Grepper.grep('" . a:options . "','" . path . "','" . string . "')"

endfunction

function! GrepperGrepCmd()

  let input = input('grep: ', '', 'file')
  if empty(input)
    return
  endif
  let parts = split(input, "'")
  execute  'ruby ' . "Grepper.grep('" . parts[0] . "','" . parts[2] . "','" . parts[1] . "')"

endfunction

function! GrepperGrepRinCmd()

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
  execute  'ruby ' . "Grepper.grep('-rin','" . iinput . "','" .  location . "')"

endfunction

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/ruby-grep")
      require "#{path}/ruby/ruby-grep/grepper.rb"
    end
  end
EOF
