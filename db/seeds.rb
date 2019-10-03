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

newsapi = News.new("a7d3bf96226e4fa68956628033f0c93d")
topics = ["Sports", "Election", "Trade", "White House", "International", "Business", "Entertainment", "Economics", "Protests", "Climate Change", "LGBTQ", "Technology", "Health"]

topics.each do |topic|
    Topic.create(title: topic)
end

Topic.all.each do |topic|
    fetch_arr = newsapi.get_everything(
        q: topic.title,
        sources: 'abc-news, al-jazeera-english, associated-press, bbc-news, cbs-news, cnn, fox-news, msnbc, the-hill, the-new-york-times, the-washington-post, the-telegraph, time, usa-today, the-wall-street-journal',
        language: 'en',
        pageSize: 100
        )

    fetch_arr.each do |article|
        Article.assign_topic(article, topic)
    end
end