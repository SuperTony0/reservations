class Trip < ActiveRecord::Base
  
  has_many :join_table_trip_users
  has_many :users, through: :join_table_trip_users
  has_many :rooms, :dependent => :delete_all
  validates :date_start, presence: true 
  validates :date_end, presence: true 
  validate :end_after_start, on: :create

  def end_after_start
    if date_start.to_datetime > date_end
      errors.add(:date_end, "Must be same day or later than start")
    end
  end
end
