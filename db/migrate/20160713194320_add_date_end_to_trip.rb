class AddDateEndToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :date_end, :datetime
  end
end
