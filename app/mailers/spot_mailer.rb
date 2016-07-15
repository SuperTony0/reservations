class SpotMailer < ApplicationMailer
  default from: 'tony.h.goldsmith@gmail.com'

  def take_spot(room_owner_id, current_user_id)
      @owner = User.find(room_owner_id)
      @user = User.find(current_user_id)
      mail(to: @owner.email, 
        subject: 'Room Update from TripApp') 

  end
end
