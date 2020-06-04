class Weight < ApplicationRecord
    validates :weight_input, :presence => true
    validates :weight_input, :numericality => { :greater_than => 0 }
    belongs_to :user

    def display_date
        self.created_at.strftime("Submitted %A, %B %e, %Y")
    end


end
