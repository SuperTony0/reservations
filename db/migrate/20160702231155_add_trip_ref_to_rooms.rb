class AddTripRefToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :trip, index: true, foreign_key: true
  end
end
