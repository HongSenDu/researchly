class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :projects, :name, false
  end
end
