class Group < ApplicationRecord
    has_many :users, :through => :membership
    has_many :projects, :dependent => :destroy
    has_many :memberships, :dependent => :destroy
end
