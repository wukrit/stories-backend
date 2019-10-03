class TopicsController < ApplicationController

    def index
        @topics = Topic.all
        render json: @topics, include: ["articles", "articles.likes", "articles.dislikes"]
    end

    def show
        @topic = Topic.find(params[:id])
        render json: @topic, include: ["articles", "articles.likes", "articles.dislikes"]
    end

    def tree
        @topics = Topic.names
        @sources = Topic.sources

        @topics.map! do |topic|
            arts = Article.by_topic(topic)
            srcs = @sources.map do |source|
                {
                    name: source,
                    value: arts.select{ |art| art.source == source }.count
                }
            end
            {
                name: topic,
                children: srcs
            }
        end

        @tree = {
            name: "Tree",
            children: @topics
        }
        render json: @tree
    end
end
