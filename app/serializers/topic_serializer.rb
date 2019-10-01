class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :value
  has_many :articles
end
