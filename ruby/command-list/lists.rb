CommandList::register_list(
  :name  => 'Align',
  :map   =>'<LEADER>a',
  :map_item_with_list => true,
  :items => [
    {
      :function    => ':Align=',
      :map         => 'e',
      :text        => '[e]qual               =',
      :visual_mode => true,
    },
    {
      :function    => ':Align|',
      :map         => 'p',
      :text        => '[p]ipe                |',
      :visual_mode => true,
    },
    {
      :function    => ':Align[',
      :map         => 's',
      :text        => '[s]quare              [',
      :visual_mode => true,
    },
    {
      :function    => ':Align]',
      :map         => 'xs',
      :text        => '[x]close [s]quare     ]',
      :visual_mode => true,
    },
    {
      :function    => ':Align=>',
      :map         => 'a',
      :text        => '[a]rrow               =>',
      :visual_mode => true,
    },
    {
      :function    => ':Align(',
      :map         => 'b',
      :text        => '[b]racket             (',
      :visual_mode => true,
    },
    {
      :function    => ':Align(',
      :map         => 'xb',
      :text        => '[x]close [b]racket    ]',
      :visual_mode => true,
    },
    {
      :function    => ':Align{',
      :map         => 'c',
      :text        => '[c]urly               {',
      :visual_mode => true,
    },
    {
      :function    => ':Align}',
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
      :function    => 'CheckLineStepDefinition()',
      :map         => 'cl',
      :text        => '[c]heck step definition on the [l]ine',
    },
    {
      :function    => 'CheckFileStepDefinition()',
      :map         => 'cf',
      :text        => '[c]heck step definition for the [f]ile',
    },
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
      :function    => 'OpenGizmoPage()',
      :map         => 'g',
      :text        => '[g]izmo page',
    },
  ]
)
