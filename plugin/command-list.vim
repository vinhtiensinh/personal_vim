rubyf $HOME/.vim/ruby/command-list/ruby_vim_extension.rb
rubyf $HOME/.vim/ruby/command-list/command-list.rb
rubyf $HOME/.vim/command-lists.rb
ruby VIM::register_vim_command('DisplayCommandList', 'CommandList::display_command_list')
ruby VIM::register_vim_command('ExecuteFunction', 'CommandList::execute_function')
command DisplayCommandList ruby CommandList::display_command_list()
map <silent> <LEADER>l  :DisplayCommandList<CR>
