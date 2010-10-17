function! GrepperGrep(options, path, string)
  let path = a:path
  let string = a:string

  if empty(a:string)
    let string = expand('<cword>')
  endif

  if empty(a:path)
    let path = input('grep -' . a:options . " '" . string . "' " . '<where ?>: ', "", "file")
  endif

  execute  'ruby ' . "Grepper.grep('" . a:options . "','" . path . "','" . string . "')"

endfunction

ruby << EOF
  # require Ruby files
  VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if File.exist?("#{path}/ruby/ruby-grep")
      require "#{path}/ruby/ruby-grep/grepper.rb"
    end
  end
EOF
