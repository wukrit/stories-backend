class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :source, :author,:url, :img_url, :description, :content, :published_at
  
  belongs_to :topic
  has_many :likes
  has_many :dislikes
end
