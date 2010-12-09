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
      :map         => 'ns',
      :text        => '[n]ew [s]tep definition',
    },
    {
      :function    => '\<C-W>\<C-]>\<C-W>T',
      :map         => 'j',
      :text        => '[j]ump to step definition',
    }
  ]
)

CommandList::register_list(
  :name  => 'Jump',
  :map_item_with_list => true,
  :items => [
    {
      :function    => '<C-]>',
      :map         => 'ga',
      :text        => 't[a]g',
    },
    {
      :function    => 'gf',
      :map         => 'gf',
      :text        => '[f]ile',
    },
    {
      :function    => '^gf',
      :map         => 'gl',
      :text        => 'file on the current [l]ine',
    },
    {
      :function    => 'OpenFilesFromClipboard()',
      :map         => 'gc',
      :text        => 'open file path in [c]lipboard',
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
      :text        => 'grep -rin command',
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
      :function    => [":CMiniBufExplorer", ":Gdiff", ":TMiniBufExplorer"],
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
  :map   =>'<LEADER>.',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ":call SwitchToProjectCmd('librea')",
      :map         => 'l',
      :text        => '[l]ibrea',
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
      :function    => ":call SwitchToProjectCmd('product-e2e')",
      :map         => 'p',
      :text        => '[p]roduct-e2e',
    },
    {
      :function    => ":call SwitchToProjectCmd('customer-platform')",
      :map         => 'c',
      :text        => '[c]ustomer-platform',
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
      :function    => ":call SwitchToProjectByName()",
      :map         => '.',
      :text        => '[.] switch with input',
    },
  ]
)
