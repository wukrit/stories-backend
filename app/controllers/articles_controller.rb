class ArticlesController < ApplicationController

    def index
        @articles = Article.all
        render json: @articles, include: "**"
    end

    def show
        @article = Article.find(params[:id])
        render json: @article, include: "**"
    end

end