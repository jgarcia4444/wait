class HealthTip < ApplicationRecord
    has_many :comments
    # has_many :replies, :through => :comments
    # has_many :users, :through => :comments
    # has_many :users, :through => :replies
end
