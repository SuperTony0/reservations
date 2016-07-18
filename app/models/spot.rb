class Spot < ActiveRecord::Base
  has_one :room

  def self.taken(room, user)
    room.spots.each do |spot|
      if spot.user_id == user.id 
        #flash[:notice] = "You already have a spot in this room!"
        return false 

      end
    end
    
  end

end
