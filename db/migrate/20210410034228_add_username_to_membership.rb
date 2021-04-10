class AddUsernameToMembership < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :username, :string
  end
end
