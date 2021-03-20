class AddStatusToDeliverable < ActiveRecord::Migration[6.1]
  def change
    add_column :deliverables, :status, :string
  end
end
