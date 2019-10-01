class Topic < ApplicationRecord
    has_many :likes, through: :articles
    has_many :dislikes, through: :articles
    has_many :article_keywords, dependent: :destroy
    has_many :articles, through: :article_keywords
    
    def self.sort
        self.all.sort_by do |topic|
            topic.articles.count
        end.reverse
    end


    def self.purge
        self.all.each do |topic|
            if Stopwords.is?(topic.title)
                topic.destroy
            end
        end
    end
end
