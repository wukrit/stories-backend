class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users, include: ["likes", "dislikes"]
    end

    def show
        @user = User.find(params[:id])
        render json: @user, include: ["likes", "dislikes"]
    end

    def create
        @user = User.create(username: params[:username])
        if @user.valid?
            render json: @user, include: ["likes", "dislikes"]
        else
            render json: {error: "That username already exists"}
        end

    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
end
