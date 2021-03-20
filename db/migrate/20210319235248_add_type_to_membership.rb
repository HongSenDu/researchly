class AddTypeToMembership < ActiveRecord::Migration[6.1]
  def change
    add_column :memberships, :type, :string
  end
end
