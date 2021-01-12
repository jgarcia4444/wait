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
        if current_user.weights[-2]
            new_weight = current_user.weights.last
            previous_weight = current_user.weights[-2]
            if new_weight.created_at.day == previous_weight.created_at.day
                previous_weight.destroy
            end
        end
        
    end

    def losing_weight?(user)
        if user.weight > user.goal
            true
        end
        false
    end

    def closer_to_goal
        user = current_user
        if user.weight && user.weights.count > 1
            newest_weight = user.weight
            previous_weight = user.weight[-2]
            is_losing_weight = losing_weight?(user)
            if is_losing_weight
                if newest_weight < previous_weight
                    "Great job! You are moving closer to your goal. Stay consistent and keep up the good work."
                else
                    "It's okay, don't let this dishearten you. Keep focusing on your health and be patient your weight will be where you want it to be in time."
                end
            else
                if newest_weight > previous_weight
                    "Great job! You are moving closer to your goal. Stay consistent and keep up the good work."
                else
                    "It's okay, don't let this dishearten you. Keep focusing on your health and be patient your weight will be where you want it to be in time."
                end
            end
        end
    end

end
