class CreateRoomTrip < ActiveRecord::Migration
  def change
    create_table :room_trips, id: false do |t|
      t.references :room, index: true, foreign_key: true
      t.references :trip, index: true, foreign_key: true
    end
  end
end
