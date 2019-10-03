class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :value
  has_many :articles
  has_many :likes, through: :articles
  has_many :dislikes, through: :articles
end
