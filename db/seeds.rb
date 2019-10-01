# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'news-api'
require 'pry'

ArticleKeyword.destroy_all
Article.destroy_all
Topic.destroy_all

newsapi = News.new(Rails.application.credentials.news_api_key)

array_of_articles = newsapi.get_everything(
                                            sources: 'abc-news, al-jazeera-english, associated-press, bbc-news, cbs-news, cnn, fox-news, msnbc, the-hill, the-new-york-times, the-washington-post, the-telegraph, time, usa-today, the-wall-street-journal',
                                            from: '2019-09-20',
                                            to: '2019-09-30',
                                            language: 'en',
                                            pageSize: 100
                                            )

array_of_articles.each do |article|
    Article.create(title: article.title, source: article.name, author: article.author, url: article.url, description: article.description, content: article.content, published_at: article.publishedAt)
end

Article.create_topics()
Topic.all.map do |topic|
    topic.update(value: topic.articles.count)
end
Article.all.map do |article|
    article.update(value: article.article_keywords.count)
end
Topic.purge