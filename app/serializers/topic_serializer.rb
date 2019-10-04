class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :value

  has_many :articles

  def articles
    Article.limited
  end
end
