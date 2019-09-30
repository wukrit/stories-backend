class Article < ApplicationRecord
  # belongs_to :topic
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
end
