class Deliverable < ApplicationRecord
    belongs_to :project
    has_many :users, :through => :assignment
end
