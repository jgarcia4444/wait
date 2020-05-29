class SessionController < ApplicationController
    def new
        
    end
    def create
        if @user = User.find_by( :email => params[:user_login][:email])
            if @user.authenticate(params[:user_login][:password])
                session[:user_id] = @user.id
                redirect_to users_path(@user)
            else
                flash[:alert] = "Invalid Password."
                render :new
            end
        else
            flash[:alert] = "No user found with the given email."
            render :new
        end
    end
    def logout
        reset_session
        redirect_to root_path
    end
end