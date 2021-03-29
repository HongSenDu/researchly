class AddDeadlineToDeliverable < ActiveRecord::Migration[6.1]
  def change
    add_column :deliverables, :deadline, :timestamp
  end
end
