require 'gserver'

class VimBackendServer < GServer
  def initialize(port=61000, *args)
    super(port, *args)
  end

  def serve (io)
    VIM::command("split")
  end
end

server = VimBackendServer.new(61000)
server.start
