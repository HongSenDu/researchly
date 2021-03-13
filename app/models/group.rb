class Group < ApplicationRecord
    has_many :users, :through => :membership

    def self.search(search)
        if search
            group = self.find_by(name:"%#{search}%")
        else
            @groups
        end
    end
end
