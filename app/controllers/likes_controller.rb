class LikesController < ApplicationController
    def index
        @likes = Like.all
        render json: @likes
    end

    def show
        @like = like.find(params[:id])
        render json: @like
    end

    def create
        @like = Like.create(article_id: params[:article_id], user_id: params[:user_id])
        render json: @like
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
    end
end
