CommandList::register_list(
  :name  => 'Align',
  :items => [
    {
      :function    => 'Align=',
      :map         => 'e',
      :text        => '=  [e]qual',
      :visual_mode => true,
    },
    {
      :function    => 'Align|',
      :map         => 'p',
      :text        => '|  [p]ipe',
      :visual_mode => true,
    },
    {
      :function    => 'Align[',
      :map         => 's',
      :text        => '[  [s]quare',
      :visual_mode => true,
    },
    {
      :function    => 'Align]',
      :map         => 'cs',
      :text        => ']  [c]close [s]quare',
      :visual_mode => true,
    },
    {
      :function    => 'Align=>',
      :map         => '=>',
      :text        => '=> [a]rrow',
      :visual_mode => true,
    },
    {
      :function    => 'Align(',
      :map         => 'b',
      :text        => '(  [b]racket',
      :visual_mode => true,
    },
    {
      :function    => 'Align(',
      :map         => 'cb',
      :text        => ')  [c]lose [b]racket',
      :visual_mode => true,
    },
    {
      :function    => 'Align{',
      :map         => 'c',
      :text        => '{  [c]urly',
      :visual_mode => true,
    },
    {
      :function    => 'Align}',
      :map         => 'cc',
      :text        => '}  [c]lose [c]urly',
      :visual_mode => true,
    }
  ]
)
