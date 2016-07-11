class Room < ActiveRecord::Base
  belongs_to :trips
  has_many :spots
end
