def display_command_list()
  VIM::command('split __Command-List__')
  command_list = ["StepFileRecommendations", "JumpStep"]
  VIM::Buffer.current.append(0, command_list)
  VIM::set_option('buftype=nofile')
  VIM::command('map <buffer> <CR> :call ExecuteFunction()<CR>')
end

def execute_function()
  function = VIM::Buffer.current.line.match(/^\s*(\w+)?/).captures.first
  VIM::command("bd __Command-List__")
  VIM::command("call #{function}()")
end

