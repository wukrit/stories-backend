class Topic < ApplicationRecord
    has_many :likes, through: :articles
    has_many :dislikes, through: :articles
    has_many :article_keywords, dependent: :destroy
    has_many :articles, through: :article_keywords
    
    def self.sources
        ["CNN", "The New York Times", "BBC News", "USA Today", "Time", "ABC News", "The Wall Street Journal", "Al Jazeera English", "The Washington Post", "Fox News", "The Telegraph", "MSNBC", "Associated Press", "CBS News", "The Hill"] 
    end

    def self.names
        Topic.all.pluck(:title)
    end

    def sources
        arr = Article.all.select do |article|
            article.topics.include?(self)
        end
        arr.pluck(:source).uniq
    end

end
