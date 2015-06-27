class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :type
      t.boolean :seen

      t.timestamps null: false
    end
  end
end
