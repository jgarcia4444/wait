class User < ApplicationRecord
    has_secure_password
    has_many :weights, dependent: :destroy
    has_many :comments
    has_many :replies, dependent: :destroy
    has_many :replies, :through => :comments, dependent: :destroy
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true

    def weight_entries_count
        self.weights.count
    end

    def last_recorded_weight
        self.weights.last
    end

    def distance_to_goal
        self.goal && self.weight ? self.goal - self.weight : nil 
    end

    def average_weight
        if self.weight_entries_count > 0
           sum = 0
            self.weights.each do |weight|
                sum += weight.weight_input
            end
            (sum / self.weights.count.to_f).round(2) 
        else
            self.weight
        end
        
    end

    def body_mass_index
        height_in_meters = self.height / 39.37
        weight_in_kg = self.weight / 2.204
        (weight_in_kg / height_in_meters ** 2).round(2)
    end

end
