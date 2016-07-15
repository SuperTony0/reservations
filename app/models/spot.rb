class Spot < ActiveRecord::Base
  has_one :room

  def validate(room, user)
    room.spots.each do |spot|
      if spot.user_id == user.id 
        return false
      end
    end
    
  end
end
