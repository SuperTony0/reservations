class JoinTableTripUser < ActiveRecord::Base
  attr_accessor :trip_id, :user_id
  belongs_to :trip, required: true
  belongs_to :user, required: true
  
end
