class Comment < ApplicationRecord
    belongs_to :health_tip
    belongs_to :user
    # has_many :replies
end
