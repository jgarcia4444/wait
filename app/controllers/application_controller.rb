class ApplicationController < ActionController::Base

    helper_method :current_user, :time_dependent_greeting, :replace_weight_if_entered_today

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

    def replace_weight_if_entered_today
        new_weight = current_user.weights.last
        previous_weight = current_user.weights[-2]
        if new_weight.created_at.day == previous_weight.created_at.day
            previous_weight.destroy
        end
    end

end
