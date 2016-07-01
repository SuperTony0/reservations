class Room < ActiveRecord::Base
  has_many :trips
end
