class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :likes
  has_many :dislikes
end
