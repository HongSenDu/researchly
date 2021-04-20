class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.integer :group_id
      t.string :subject
      t.string :body
      t.boolean :read
      t.boolean :show_user
      t.boolean :show_recipient

      t.timestamps
    end
  end
end
