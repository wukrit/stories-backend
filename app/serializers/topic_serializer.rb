class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :value

  has_many :articles

  def articles
    Article.sort_by_date.reverse
    Article.limited
  end
end
