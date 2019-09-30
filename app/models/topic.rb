class Topic < ApplicationRecord
    has_many :likes, through: :articles
    has_many :dislikes, through: :articles
    has_many :article_keywords
    has_many :articles, through: :article_keywords
end
