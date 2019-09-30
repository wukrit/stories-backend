class RemoveCategoryFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :category, :string
  end
end
