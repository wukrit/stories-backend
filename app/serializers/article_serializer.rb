class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :source, :author,:url, :img_url, :description, :content, :published_at
  has_many :topics
end
