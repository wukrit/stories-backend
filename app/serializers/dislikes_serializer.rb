class DislikesSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :user_id
end
