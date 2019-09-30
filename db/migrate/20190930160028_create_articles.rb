class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source
      t.string :author
      t.string :url
      t.string :keywords

      t.timestamps
    end
  end
end
