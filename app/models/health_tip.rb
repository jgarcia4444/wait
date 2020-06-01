class HealthTip < ApplicationRecord
    has_many :comments
    has_many :replies, :through => :comments
    has_many :users, :through => :comments

    def comments_count
        self.comments.count
    end

    def self.filter(category)
        self.where(:category => category)
    end

end
