class User < ApplicationRecord
    has_secure_password
    has_many :weights

    def weight_entries_count
        self.weights.count
    end

    def difference_from_goal_weight
        (self.goal - last_recorded_weight.weight_input).abs()
    end

    def last_recorded_weight
        self.weights.last
    end

end
