class Project < ApplicationRecord

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user}

    has_many :deliverables, :dependent => :destroy

    def self.name_order
        Project.order("name")
      end

    def self.status_order
      Project.order("status").reverse_order
    end

end
