# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

=begin
10.times do
  User.create!(first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, email:Faker::Internet.email, password:"Password")
end

10.times do
  Trip.create!(destination:Faker::Pokemon.location,date_start:Faker::Date.backward(2), date_end:Faker::Date.forward(25))
end
=end
10.times do
  Room.create(capacity:Faker::Number.digit, description:"Hotel", location:Faker::Address.street_name, number:Faker::Address.building_number,trip_id:Faker::Number.between(1,10), owner_id:Faker::Number.between(1,10))
end
