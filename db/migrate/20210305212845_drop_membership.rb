class DropMembership < ActiveRecord::Migration[6.1]
  def change
    drop_table :membership
  end
end
