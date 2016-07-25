require "rails_helper"

RSpec.describe Trip, type: :model do 
  let(:trip_good) {Trip.new(destination:"chicago", date_start:'7/12/16', date_end:Time.now.to_s)}
  let(:trip_bad) {Trip.new(destination:nil, date_start:'7/12/16', date_end:'7/12/16')}

  describe 'initialization' do
    it 'should work fine' do
      expect(trip_good.destination).to be_a String
      expect(trip_good.date_start).to be_a String
      expect(trip_good.date_end).to be_a String
    end
  end
  describe 

end
