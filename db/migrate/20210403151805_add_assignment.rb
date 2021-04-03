class AddAssignment < ActiveRecord::Migration[6.1]
  create_table :assignments do |t|
    t.belongs_to :user
    t.belongs_to :deliverable
    t.datetime :assignment_date
    t.timestamps
  end
end
