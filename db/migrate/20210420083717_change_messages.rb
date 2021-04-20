class ChangeMessages < ActiveRecord::Migration[6.1]
  def change
    change_table :messages do |t|
      t.rename :read, :user_read #t.string -> t.rename
    end
    add_column :messages, :recipient_read, :boolean
  end
end
