class AddIndexToSpot < ActiveRecord::Migration
  def change
    add_foreign_key :spots, :rooms
  end
end
