class Deliverable < ApplicationRecord
    include PublicActivity::Model
    tracked owner: ->(controller, model) { controller && controller.current_user}

    belongs_to :project
    has_many :users, :through => :assignment

    
end
