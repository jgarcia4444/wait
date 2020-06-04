class ApplicationController < ActionController::Base

    helper_method :current_user, :time_dependent_greeting, 
    :replace_weight_if_entered_today, :closer_to_goal

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
    
    def closer_to_goal
        new_weight = current_user.weights.last
        previous_weight = current_user.weights[-2]
        new_difference_from_goal = (current_user.goal - new_weight.weight_input).abs()
        previous_difference_from_goal = (current_user.goal - previous_weight.weight_input).abs()
        if new_difference_from_goal < previous_difference_from_goal
            "Great job! You are moving closer to your goal. Stay consistent and keep up the good work."
        else
            "It's okay, don't let this dishearten you. Keep focusing on your health and be patient your weight will be where you want it to be in time."
        end
    end

end
