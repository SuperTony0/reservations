class JoinTableTripUser < ActiveRecord::Base
  
  belongs_to :trip, required: true
  belongs_to :user, required: true
  
end
