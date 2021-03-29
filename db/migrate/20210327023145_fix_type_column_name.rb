class FixTypeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :memberships, :type, :member_type 
  end
end
