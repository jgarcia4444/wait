class User < ApplicationRecord
    has_secure_password
    has_many :weights
    has_many :comments
    has_many :replies
    has_many :replies, :through => :comments
    validates :name, :presence => true
    validates :email, :presence => true
    validates :email, :uniqueness => true
    validates :height, :presence => true
    validates :height, :numericality => { :greater_than => 0 }
    validates :weight, :presence => true
    validates :weight, :numericality => { :greater_than => 0 }
    validates :gender, :presence => true
    validates :goal, :presence => true
    validates :goal, :numericality => { :greater_than => 0 }

    def weight_entries_count
        self.weights.count
    end

    def difference_from_goal_weight
        last_recorded_weight ? (self.goal - last_recorded_weight.weight_input).abs() : (self.goal - self.weight).abs()
    end

    def last_recorded_weight
        self.weights.last
    end

end
