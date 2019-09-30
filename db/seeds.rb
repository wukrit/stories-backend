# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'news-api'
require 'pry'
require 'stopwords'

Article.destroy_all


newsapi = News.new(Rails.application.credentials.news_api_key)

array_of_articles = newsapi.get_everything(
                                        sources: 'abc-news, al-jazeera-english, associated-press, bbc-news, cbs-news, cnn, fox-news, msnbc, the-hill, the-new-york-times, the-washington-post, the-telegraph, time, usa-today, the-wall-street-journal',
                                        from: '2019-09-20',
                                        to: '2019-09-30',
                                        language: 'en',
                                        pageSize: 100
                                        )

temp_obj_arr = []

array_of_articles.each do |article|
    temp_obj_arr << Article.new(title: article.title, source: article.name, author: article.author, url: article.url, description: article.description, content: article.content, published_at: article.publishedAt)
end


temp_obj_arr.each do |article|
    if article.content == nil
        article.content = ""
    end
    if article.description == nil
        article.description = ""
    end
    if article.title == nil
        article.title = ""
    end

    temp_keywords = article.title.downcase.gsub(/[.,\/#!$%\^&\*;:{}=\-_`~()]/,"")
    keywords_to_array = temp_keywords.split.uniq

    keywords = keywords_to_array[0..-4]
    
    keywords.each do |word|
        if Stopwords.is?(word)
            keywords.delete_at(keywords.index(word))
        else
            word.pluralize(0)
        end
    end
    
    article.keywords = keywords.join(" ")
end