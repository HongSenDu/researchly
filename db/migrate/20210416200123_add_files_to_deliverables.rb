class AddFilesToDeliverables < ActiveRecord::Migration[6.1]
  def change
    add_column :deliverables, :files, :string
  end
end
