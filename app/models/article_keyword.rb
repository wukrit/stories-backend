class ArticleKeyword < ApplicationRecord
  belongs_to :topic
  belongs_to :article
end
