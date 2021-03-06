class Room < ActiveRecord::Base
  belongs_to :trips
  has_many :spots, :dependent => :destroy
  belongs_to :owner, class_name: "User"

  def is_owner?(current_user)
    if owner_id == nil
      return false
    elsif owner_id == current_user.id
      return true
    else
      return false
    end
  end

  def fill(current_user)
    self.capacity.times do 
      self.spots.create
    end
    Spot.update(self.spots.first.id, :user_id => current_user.id)
  end
end
