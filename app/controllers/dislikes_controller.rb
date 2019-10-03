class DislikesController < ApplicationController
    def index
        @dislikes = Dislike.all
        render json: @dislikes
    end

    def show
        @dislike = Disike.find(params[:id])
        render json: @dislike
    end

    def create
        @dislike = Dislike.create(article_id: params[:article_id], user_id: params[:user_id])
        render json: @dislike
    end

    def destroy
        @dislike = Dislike.find(params[:id])
        @dislike.destroy
    end
end
