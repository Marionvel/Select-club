class UsersController < ApplicationController

    def new
        @users = User.new
    end

    def create
        @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], pseudo: params[:user][:pseudo], email: params[:user][:email], password: params[:user][:password])
        redirect_to @user
    end

    def show
        @user = User.find_by_id(params[:id])
    end

end
