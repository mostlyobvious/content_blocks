ActiveRecord::Schema.define(:version => 0) do
  create_table :content_blocks_snippets, :force => true do |t|
    t.string :label, :null => false
    t.text :content
    t.string :status
    t.timestamps :null => false
  end

  create_table :content_blocks_news_articles, :force => true do |t|
    t.string :title, :null => false
    t.string :lead
    t.text :body
    t.string :status
    t.timestamps :null => false
  end
end
