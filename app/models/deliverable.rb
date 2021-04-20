class Deliverable < ApplicationRecord
    include PublicActivity::Common
    #tracked owner: ->(controller, model) { controller && controller.current_user}
    belongs_to :project
    has_many :users, :through => :assignment
    mount_uploaders :files, FileUploader
    serialize :files, JSON # If you use SQLite, add this line.
end
