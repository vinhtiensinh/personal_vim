CommandList::register_list(
  :name  => 'Align',
  :map   =>'<LEADER>a',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ":!~/.vim/scripts/aligner.rb '=' -",
      :map         => 'e',
      :text        => '[e]qual               =',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '==' -",
      :map         => '=',
      :text        => '[=]=               ==',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '|' -",
      :map         => 'p',
      :text        => '[p]ipe                |',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '[' -",
      :map         => 's',
      :text        => '[s]quare              [',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb ']' -",
      :map         => 'xs',
      :text        => '[x]close [s]quare     ]',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '=>' -",
      :map         => 'a',
      :text        => '[a]rrow               =>',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '(' -",
      :map         => 'b',
      :text        => '[b]racket             (',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb ')' -",
      :map         => 'xb',
      :text        => '[x]close [b]racket    )',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '{' -",
      :map         => 'c',
      :text        => '[c]urly               {',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '}' -",
      :map         => 'xc',
      :text        => '[x]close [c]urly      }',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb '#' -",
      :map         => 'h',
      :text        => '[h]ash                #',
      :visual_mode => true,
    },
    {
      :function    => ":!~/.vim/scripts/aligner.rb ':' -",
      :map         => 'k',
      :text        => '[k]colon                :',
      :visual_mode => true,
    }
  ]
)

CommandList::register_list(
  :name  => 'Cucumber',
  :map   =>'<LEADER>c',
  :map_item_with_list => true,
  :items => [
    {
      :function    => 'StepFileRecommendations()',
      :map         => 'n',
      :text        => '[n]ew step definition',
    },
    {
      :function    => ':ruby Cucumber.fetch_all_steps; VIMCucumber.check_steps_on_file',
      :map         => 'c',
      :text        => 'refresh cucumber steps and [c]heck current file',
    },
  ]
)

CommandList::register_list(
  :name  => 'Jump',
  :map_item_with_list => true,
  :items => [
    {
      :function    => '^gf',
      :map         => 'gl',
      :text        => 'file on the current [l]ine',
    },
    {
      :function    => 'OpenGizmoPage("e")',
      :map         => 'gz',
      :text        => 'gi[z]mo page',
    },
    {
      :function    => ':ruby SmartJumper.jump("e")',
      :map         => 'gp',
      :text        => '[p]erl class',
    }
  ]
)

CommandList::register_list(
  :name  => 'Search',
  :map   =>'<LEADER>s',
  :map_item_with_list => true,
  :items => [
    {
      :function    => "GrepperGrep('-rin', '.', '')",
      :map         => '.',
      :text        => 'search for word case insensitive in current[.] directory',
    },
    {
      :function    => "GrepperGrep('-rin','','')",
      :map         => 'w',
      :text        => 'search for [w]ord case insensitive',
    },
    {
      :function    => "GrepperGrep('-rn','','')",
      :map         => 's',
      :text        => 'search for word case [s]ensitive',
    },
    {
      :function    => "GrepperGrepRinCmd()",
      :map         => 'g',
      :text        => '[g]rep -rin command',
    },
    {
      :function    => "GrepperGrepCmd()",
      :map         => 'c',
      :text        => 'grep [c]ommand, grep word need to be in quote',
    }
  ]
)

CommandList::register_list(
  :name  => 'Git',
  :map   =>'<LEADER>g',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ":Gstatus",
      :map         => 's',
      :text        => 'git [s]tatus',
    },
    {
      :function    => [":NERDTreeClose", ":CMiniBufExplorer", ":Gdiff", ":TMiniBufExplorer"],
      :map         => 'd',
      :text        => 'git [d]iff file',
    },
    {
      :function    => ":call Terminal_cd_dir('git diff')",
      :map         => 'D',
      :text        => 'git [D]iff all',
    },
    {
      :function    => ":call Terminal_cd_dir('git diff --cached')",
      :map         => 'dc',
      :text        => 'git [d]iff [c]ache',
    },
    {
      :function    => ":Gblame",
      :map         => 'b',
      :text        => 'git [b]lame',
    },
    {
      :function    => ":Gcommit",
      :map         => 'c',
      :text        => 'git [c]ommit',
    },
    {
      :function    => ":Gmove",
      :map         => 'm',
      :text        => 'git [m]ove',
    },
    {
      :function    => ":Gremove",
      :map         => 'x',
      :text        => 'git [x]remove',
    },
    {
      :function    => ":Gedit",
      :map         => 'e',
      :text        => 'git [e]dit',
    },
    {
      :function    => ":Glog",
      :map         => 'o',
      :text        => 'git l[o]g',
    },
    {
      :function    => ":Git pull",
      :map         => 'u',
      :text        => 'git p[u]ll',
    },
    {
      :function    => ":Git pull && git push",
      :map         => 'p',
      :text        => 'git [p]ull and push',
    }
  ]
)

CommandList::register_list(
  :name  => 'Switch Project',
  :map   =>'<LEADER>;',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ":call SwitchToProjectCmd('librea')",
      :map         => 'l',
      :text        => '[l]ibrea',
    },
    {
      :function    => ":call SwitchToProjectCmd('jetwire')",
      :map         => 'j',
      :text        => '[j]etwire',
    },
    {
      :function    => ":call SwitchToProjectCmd('agentdesktop')",
      :map         => 'a',
      :text        => '[a]gentdesktop',
    },
    {
      :function    => ":call SwitchToProjectCmd('reaxml')",
      :map         => 'r',
      :text        => '[r]eaxml',
    },
    {
      :function    => ":call SwitchToProjectCmd('readb')",
      :map         => 'b',
      :text        => 'read[b]',
    },
    {
      :function    => ":call SwitchToProjectCmd('product-e2e')",
      :map         => 'p',
      :text        => '[p]roduct-e2e',
    },
    {
      :function    => ":call SwitchToProjectCmd('ec')",
      :map         => 'e',
      :text        => '[e]c'
    },
    {
      :function    => ":call SwitchToProjectCmd('cp-agentadmin')",
      :map         => 'c',
      :text        => '[c]p-agentadmin'
    },
    {
      :function    => ":call SwitchToProjectCmd('db-migrations')",
      :map         => 'd',
      :text        => '[d]b-migrations',
    },
    {
      :function    => ":call SwitchToProjectCmd('vim')",
      :map         => 'v',
      :text        => '[v]im',
    },
    {
      :function    => ":call SwitchToProjectCmd('thumbelina')",
      :map         => 't',
      :text        => '[t] thumbelina',
    },
    {
      :function    => ":call SwitchToProjectCmd('zsh')",
      :map         => 'z',
      :text        => '[z]sh',
    },
    {
      :function    => ":call SwitchToPath()",
      :map         => 'f',
      :text        => '[f] switch with input',
    },
    {
      :function    => ":call CloseProject(GetCurrentProject())",
      :map         => 'w',
      :text        => '[w] close current project',
    },
    {
      :function    => ":call CloseProject('librea')",
      :map         => 'xl',
      :text        => '[x]close [l]ibrea',
    },
    {
      :function    => ":call CloseProject('agentdesktop')",
      :map         => 'xa',
      :text        => '[x]close agentdesktop',
    },
    {
      :function    => ":call CloseProject('reaxml')",
      :map         => 'xr',
      :text        => '[x]close [r]eaxml',
    },
    {
      :function    => ":call CloseProject('readb')",
      :map         => 'xb',
      :text        => '[x]close read[b]',
    },
    {
      :function    => ":call CloseProject('product-e2e')",
      :map         => 'xp',
      :text        => '[x]close [p]roduct-e2e',
    },
    {
      :function    => ":call CloseProject('ec')",
      :map         => 'xe',
      :text        => '[x]close [e]c'
    },
    {
      :function    => ":call CloseProject('customer-platform')",
      :map         => 'xc',
      :text        => '[x]close [c]ustomer-platform',
    },
    {
      :function    => ":call CloseProject('db-migrations')",
      :map         => 'xd',
      :text        => '[x]close [d]b-migrations',
    },
    {
      :function    => ":call CloseProject('vim')",
      :map         => 'xv',
      :text        => '[x]close [v]im',
    },
  ]
)
CommandList::register_list(
  :name  => 'Rails Goto...',
  :map   =>'gr',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ":Rcontroller",
      :map         => 'c',
      :text        => '[c]ontroller',
    },
    {
      :function    => ":Rview",
      :map         => 'v',
      :text        => '[v]iew',
    },
    {
      :function    => ":Rlayout",
      :map         => 'l',
      :text        => '[l]ayout',
    },
    {
      :function    => ":Rmodel",
      :map         => 'm',
      :text        => '[m]odel',
    },
    {
      :function    => ":Renvironment",
      :map         => 'e',
      :text        => '[e]nvironment config',
    },
    {
      :function    => ":Rspec",
      :map         => 's',
      :text        => '[s]spec',
    },
    {
      :function    => ":Rhelper",
      :map         => 'h',
      :text        => '[h]elper',
    },
    {
      :function    => ":Rstylesheet",
      :map         => 'y',
      :text        => 'st[y]lesheet',
    },
    {
      :function    => ":Rmigration",
      :map         => 'i',
      :text        => 'm[i]gration',
    },
    {
      :function    => ":Rtask",
      :map         => 't',
      :text        => '[t]ask',
    },
    {
      :function    => ":Rjavascript",
      :map         => 'j',
      :text        => '[j]avascript',
    },
    {
      :function    => ":Rfixtures",
      :map         => 'f',
      :text        => '[f]fixtures',
    },
    {
      :function    => ":Rlocale",
      :map         => 'o',
      :text        => 'l[o]cale',
    },
    {
      :function    => ":A",
      :map         => 'a',
      :text        => '[a]lternate a(model) = spec',
    },
    {
      :function    => ":Relate",
      :map         => 'r',
      :text        => '[r]elate a(model) = schema',
    },
  ]
)

CommandList::register_list(
  :name  => 'Delete ...',
  :map   =>'<LEADER>d',
  :map_item_with_list => true,
  :items => [
    {
      :function    => "DeleleteInnerMostSurround()",
      :map         => 's',
      :text        => 'inner most [s]urround',
    },
  ]
)

CommandList::register_list(
  :name  => 'Refactor ...',
  :map   =>'<LEADER>r',
  :map_item_with_list => true,
  :items => [
    {
      :function    => "ExtractVariable()",
      :map         => 'v',
      :text        => 'extract [v]ariable',
    },
    {
      :function    => "ExtractMethod()",
      :map         => 'm',
      :text        => 'extract [m]ethod',
    },
  ]
)
