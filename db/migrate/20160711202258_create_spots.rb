class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :description
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
