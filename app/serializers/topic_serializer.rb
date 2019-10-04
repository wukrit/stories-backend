class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :value

  has_many :articles do 
    :articles.limit(20)
  end

end
