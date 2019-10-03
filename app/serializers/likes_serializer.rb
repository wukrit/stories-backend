class LikesSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :user_id
  
  belongs_to :article
end
