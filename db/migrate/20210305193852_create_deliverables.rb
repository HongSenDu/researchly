class CreateDeliverables < ActiveRecord::Migration[6.1]
  def change
    create_table :deliverables do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
