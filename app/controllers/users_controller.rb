class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
        render :edit
    end

    def update
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :profile_pic, :bio)
    end

end
