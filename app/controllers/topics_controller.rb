class TopicsController < ApplicationController

    def index
        @topics = Topic.sort
        render json: @topics, inlcude: "**"
    end

    def show
        @topic = Topic.find(params[:id])
        render json: @topic, include: "**"
    end

end
