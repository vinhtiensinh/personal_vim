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
  :name  => 'Browse',
  :map   =>'<LEADER>b',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ':TlistToggle',
      :map         => 't',
      :text        => '[t]ag',
    },
    {
      :function    => ':NERDTreeToggle',
      :map         => 'f',
      :text        => '[f]ile',
    }
  ]
)


CommandList::register_list(
  :name  => 'Jump',
  :map   =>'<LEADER>j',
  :map_item_with_list => true,
  :items => [
    {
      :function    => '\<C-W>\<C-]>\<C-W>T',
      :map         => 't',
      :text        => '[t]ag',
    },
    {
      :function    => '\<C-W>gF',
      :map         => 'f',
      :text        => '[f]ile',
    },
    {
      :function    => '^\<C-W>gF',
      :map         => 'l',
      :text        => 'file on the current [l]ine',
    },
    {
      :function    => 'OpenFilesFromClipboard()',
      :map         => 'c',
      :text        => 'open file path in [c]lipboard',
    },
    {
      :function    => 'OpenGizmoPage()',
      :map         => 'g',
      :text        => '[g]izmo page',
    },
    {
      :function    => ':ruby SmartJumper.jump',
      :map         => 'p',
      :text        => '[p]erl class',
    }
  ]
)

CommandList::register_list(
  :name  => 'Search',
  :map   =>'<LEADER>g',
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
      :function    => "GrepperGrepCmd()",
      :map         => 'g',
      :text        => 'grep command, grep word need to be in quote',
    }
  ]
)
