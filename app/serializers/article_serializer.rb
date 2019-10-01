class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :source, :author,:url, :description, :content, :published_at
end
