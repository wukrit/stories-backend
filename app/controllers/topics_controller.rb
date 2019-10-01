class TopicsController < ApplicationController

    def index
        @topics = Topic.all
        render json: @topics, inlcude: "**"
    end

    def show
        @topic = Topic.find(params[:id])
        render json: @topic, include: "**"
    end

end
