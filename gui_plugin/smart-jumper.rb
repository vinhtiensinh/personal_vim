SmartJumper.register_jumper(
  PerlJumper.new(
  :paths => [
    '~/branches/master/librea/lib/',
    '~/branches/master/agentdesktop/lib/',
    '~/branches/master/reaxml/lib/',
    '~/branches/master/accpac/lib/',
    '~/branches/master/appcmd/lib/',
  ],
  :files => '.pm,.t,.pl',
  :id    => 'perl'
))
