class RemoveTopicsKeyFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_reference :articles, :topics, index: true, foreign_key: true
  end
end
