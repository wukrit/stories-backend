class CreateArticleKeywords < ActiveRecord::Migration[6.0]
  def change
    create_table :article_keywords do |t|
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
