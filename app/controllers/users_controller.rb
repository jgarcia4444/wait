class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_path @user
        else
            render :new
        end
    end
    def show
        @user = current_user
    end
    def edit
        @user = current_user
    end
    def update
        @user = User.update(user_params)
        redirect_to user_path(@user)
    end
    private
        def user_params
            params.require(:user).permit(:name, :email, :password, :height, :weight, :gender, :goal)
        end
end