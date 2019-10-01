class Article < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
  has_many :article_keywords, dependent: :destroy
  has_many :topics, through: :article_keywords

    def self.exist?(article)
        if Article.find_by(url: article.url)
            selected_article = Article.find_by(url: article.url)
        else
            selected_article = Article.create(title: article.title, source: article.name, author: article.author, url: article.url, description: article.description, content: article.content, published_at: article.publishedAt)
        end
        selected_article
    end

    def self.assign_topic(article, topic)
        selected_article = Article.exist?(article)
        ArticleKeyword.create(topic_id: topic.id, article_id: selected_article.id)
    end

end
