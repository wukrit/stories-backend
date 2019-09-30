class AddTopicIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :topics, foreign_key: true
  end
end
