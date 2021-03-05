class DropGroupsUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :groups_users
  end
end
