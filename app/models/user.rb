class User < ApplicationRecord
    has_many :likes
    has_many :dislikes
    has_many :articles, through: :likes
    has_many :articles, through: :dislikes

    validates :username, uniqueness: :true
    validates :username, presence: :true
end
