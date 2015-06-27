class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :place
      t.integer :made_by_user_id

      t.timestamps null: false
    end
  end
end
