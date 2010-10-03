rubyf $HOME/.vim/ruby/command-list/ruby_vim_extension.rb
rubyf $HOME/.vim/ruby/command-list/show_list.rb
ruby VIM::register_vim_command('DisplayCommandList', 'CommandList::display_command_list')
ruby VIM::register_vim_command('ExecuteFunction', 'CommandList::execute_function')
ruby CommandList::register('Cucumber', 'StepFileRecommendations', 'display step files')
ruby CommandList::register('Cucumber', 'JumpStep', 'jump to the definition of the step')
ruby CommandList::register('Cucumber', 'CheckLineStepDefinition', 'check step definition of current line')
ruby CommandList::register('Cucumber', 'CheckFileStepDefinition', 'check step definition of the file')
