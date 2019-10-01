class AddValuesToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :value, :integer
  end
end
