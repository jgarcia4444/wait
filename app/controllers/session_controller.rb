class SessionController < ApplicationController
    def new
        
    end
    def create
        if omni_auth_request = request.env["omniauth.auth"]
            user_info = omni_auth_request["info"]
            if user = User.find_by(:email => user_info["email"])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                user = User.create(:email => user_info["email"], :name => user_info["name"], :password => SecureRandom.hex)
                session[:user_id] = user.id
                redirect_to user_path(user)
            end
        else
            if @user = User.find_by( :email => params[:user_login][:email])
                if @user.authenticate(params[:user_login][:password])
                    flash.clear
                    session[:user_id] = @user.id
                    redirect_to user_path(@user)
                else
                    flash[:alert] = "Invalid Password."
                    render :new
                end
            else
                flash[:alert] = "No user found with the given email."
                render :new
            end
        end
        
    end
    def logout
        reset_session
        redirect_to root_path
    end
end