class Project < ApplicationRecord
    has_many :deliverables, :dependent => :destroy

    def self.percent_completed(id)
        @deliverables = Deliverable.where(project_id: id)
        @done = Deliverable.where(project_id: id).where(status: "done").count
        @done = @done.to_f / @deliverables.count * 100
    end
end
