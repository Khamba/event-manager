class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :from_event_to_user
      t.boolean :delined, default: false

      t.timestamps null: false
    end

    add_index :invitations, :user_id
  end
end
