class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(username: params[:username])
        if @user.valid?
            render json: @user
        else
            render json: {error: "That username already exists"}
        end

    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
    end
end
