class Reply < ApplicationRecord
    belongs_to :comment
    belongs_to :user

    def name_of_user
        self.user.name
    end

end
