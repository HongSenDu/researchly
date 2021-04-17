class Group < ApplicationRecord
    include PublicActivity::Common

    has_many :users, :through => :membership
    has_many :projects, :dependent => :destroy
    has_many :memberships, :dependent => :destroy
end
