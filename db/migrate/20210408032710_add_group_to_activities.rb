class AddGroupToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :group, :integer
  end
end
