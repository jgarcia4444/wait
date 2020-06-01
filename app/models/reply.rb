class Reply < ApplicationRecord
    belongs_to :comment
    belongs_to :user
    validates :content, :presence => true

    def name_of_user
        self.user.name
    end

end
