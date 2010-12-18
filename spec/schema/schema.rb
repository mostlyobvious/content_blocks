ActiveRecord::Schema.define(:version => 0) do
  create_table :content_blocks_snippets, :force => true do |t|
    t.string :label, :null => false
    t.text :content
    t.string :status
    t.timestamps :null => false
  end
end
