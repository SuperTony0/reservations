class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :capacity
      t.string :description
      t.string :location
      t.string :number
      t.integer :price

      t.timestamps null: false
    end
  end
end
