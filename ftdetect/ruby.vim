" Ruby
au BufNewFile,BufRead *.rb,*.rbw,*.gem,*.gemspec	set filetype=ruby

" Ruby on Rails
au BufNewFile,BufRead *.builder,*.rxml,*.rjs		set filetype=ruby

" Rakefile
au BufNewFile,BufRead [rR]akefile,*.rake		set filetype=ruby

" Rantfile
au BufNewFile,BufRead [rR]antfile,*.rant		set filetype=ruby

" eRuby
au BufNewFile,BufRead *.erb,*.rhtml			set filetype=eruby

" rack file
au BufNewFile,BufRead *.ru			set filetype=eruby

au BufNewFile,BufRead Gemfile set filetype=ruby

au BufNewFile,BufRead Rakefile set filetype=ruby

au BufNewFile,BufRead *.thor set filetype=ruby

" vagrant file
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
