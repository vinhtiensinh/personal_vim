CommandList::register_list(
  :name  => 'Align',
  :items => [
    {
      :function    => 'Align=',
      :text        => '=',
      :visual_mode => true,
    },
    {
      :function    => 'Align|',
      :text        => '|',
      :visual_mode => true,
    },
    {
      :function    => 'Align[',
      :text        => '[',
      :visual_mode => true,
    },
    {
      :function    => 'Align]',
      :text        => ']',
      :visual_mode => true,
    },
    {
      :function    => 'Align=>',
      :text        => '=>',
      :visual_mode => true,
    }
  ]
)
CommandList::register_command(:list => 'Cucumber', :function => 'CheckLineStepDefinition()', :text => 'Check Line Step Definition')
