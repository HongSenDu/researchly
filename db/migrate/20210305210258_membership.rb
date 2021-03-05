class Membership < ActiveRecord::Migration[6.1]
  create_table :membership do |t|
    t.belongs_to :user
    t.belongs_to :group
    t.datetime :membership_date
    t.timestamps
  end
end
