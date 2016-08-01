class Trip < ActiveRecord::Base

  has_many :trip_users
  has_many :users, through: :trip_users
  has_many :rooms, :dependent => :destroy
  validates :date_start, presence: true
  validates :date_end, presence: true
  validate :end_after_start, on: :create

  def end_after_start
    if date_start.to_datetime > date_end
      errors.add(:date_end, "Must be same day or later than start")
    end
  end

  def join_trip
    @user = current_user
    @trip = Trip.find(params[:id])
    @user.trips << @trip

    redirect_to trip_path
  end
end
