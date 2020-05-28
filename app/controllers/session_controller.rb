class SessionController < ApplicationController
    def login 
    end
    def logout
        reset_session
        redirect_to root_path
    end
end