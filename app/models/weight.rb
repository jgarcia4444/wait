class Weight < ApplicationRecord
    validates :weight_input, :presence => true
    validates :weight_input, :numericality => { :greater_than => 0 }
    belongs_to :user
end
