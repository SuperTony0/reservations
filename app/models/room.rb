class Room < ActiveRecord::Base
  has_many :trips
  belongs_to :trips
end
