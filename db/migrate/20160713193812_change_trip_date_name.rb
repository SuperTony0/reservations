class ChangeTripDateName < ActiveRecord::Migration
  def change
    rename_column :trips, :date, :date_start
  end
end
