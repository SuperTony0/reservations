require "rails_helper"

RSpec.describe Room, type: :model do 
  let(:room_error) {Room.new(capacity: 4, description: 'test', owner_id: nil)}
  let(:room_success) {Room.create(capacity: 2, description: 'test')}


  
  describe 'associations' do
    it 'created spots' do
      room_success.save
      expect(room_success.spots.count).to eq 2 
    end
  end

  
end
