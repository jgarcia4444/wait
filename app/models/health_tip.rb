class HealthTip < ApplicationRecord
    has_many :comments
    has_many :replies, :through => :comments, dependent: :destroy
    has_many :users, :through => :comments, dependent: :destroy

    def comments_count
        self.comments.count
    end

    def self.filter(category)
        self.where(:category => category)
    end

end
