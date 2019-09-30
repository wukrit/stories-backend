class Article < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
  has_many :article_keywords
  has_many :topics, through: :article_keywords
end
