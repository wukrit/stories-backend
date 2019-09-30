class Article < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
  has_many :dislikes
  has_many :users, through: :dislikes
  has_many :article_keywords
  has_many :topics, through: :article_keywords

  def self.create_topics
    self.all.each do |article|
        article.init_check()

        temp_keywords = article.title.downcase.gsub(/[.,\/#!$%\^&\*;:{}=\-_`~()]/,"")
        keywords_to_array = temp_keywords.split.uniq

        keywords = keywords_to_array[0..-4]
        
        keywords.each do |word|
            if Stopwords.is?(word)
                keywords.delete_at(keywords.index(word))
            else
                word.pluralize(0)
            end

            art_key = ArticleKeyword.new(article: article)
            art_key.assign_topic(word)        
            art_key.save()
        end
        
        article.keywords = keywords.join(" ")
    end
  end

  def init_check
    if self.content == nil
        self.content = ""
    end
    if self.description == nil
        self.description = ""
    end
    if self.title == nil
        self.title = ""
    end
  end

end
