class Article < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
  has_many :article_keywords, dependent: :destroy
  has_many :topics, through: :article_keywords
  scope :limited, lambda { limit(20) }


    def self.exist?(article)
        if self.find_by(url: article.url)
            selected_article = self.find_by(url: article.url)
        else
            selected_article = self.create(title: article.title, source: article.name, author: article.author, url: article.url, img_url: article.urlToImage, description: article.description, content: article.content, published_at: article.publishedAt)
        end
        selected_article
    end

    def self.assign_topic(article, topic)
        selected_article = self.exist?(article)
        ArticleKeyword.create(topic_id: topic.id, article_id: selected_article.id)
    end

    def self.by_source(source)
        new_arr = self.all.select do |article|
            article.source === source
        end
        new_arr
    end

    def self.by_topic(topic)
        self.all.select do |article|
            article.topics.find_by(title: topic)
        end
    end

    def self.sort_by_date
        self.all.sort_by do |article|
            DateTime.parse(article.published_at)
        end
    end

end
