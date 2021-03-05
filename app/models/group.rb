class Group < ApplicationRecord
    has_many :users, :through => :membership
end
