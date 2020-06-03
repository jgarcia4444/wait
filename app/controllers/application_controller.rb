class ApplicationController < ActionController::Base

    helper_method :current_user, :time_dependent_greeting

    def current_user
        User.find_by(:id => session[:user_id])
    end

    def time_dependent_greeting
        hour_of_the_day = Time.now.hour
        if hour_of_the_day < 12
            "Good Morning"
        elsif hour_of_the_day > 12 && hour_of_the_day < 17
            "Good Afternoon"
        else
            "Good Evening"
        end
    end

end
