class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :destination
      t.datetime :date

      t.timestamps null: false
    end
  end
end
