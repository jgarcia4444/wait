class Comment < ApplicationRecord
    belongs_to :health_tip
    belongs_to :user
    has_many :replies
    has_many :users, :through => :replies
    validates :content, :presence => true

    def health_tip_title
        self.health_tip.title
    end

    def name_of_user
        self.user.name
    end

    def reply_count
        self.replies.count
    end

end
