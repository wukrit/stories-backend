class AddDescriptionAndContentToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :description, :string
    add_column :articles, :content, :string
    add_column :articles, :published_at, :string
  end
end
