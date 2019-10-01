class AddValuesToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :value, :integer
  end
end
