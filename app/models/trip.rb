class Trip < ActiveRecord::Base
  
  has_many :join_table_trip_users
  has_many :users, through: :join_table_trip_users
  has_many :rooms
end
