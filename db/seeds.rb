# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



users = User.create!([ {first_name: 'Tony', last_name: 'Goldsmith', email: 'tony.h.goldsmith@gmail.com', password: 'Password'}, {first_name: 'Anthony', last_name: 'Goldsmith', email: 'anthony.h.goldsmith@gmail.com', password: 'Password'}, {first_name: 'Bill', last_name: 'Murray', email: 'tonyhgoldsmith@gmail.com', password: 'Password'}, {first_name: 'Sean', last_name: 'Connery', email: 'tonyh.goldsmith@gmail.com', password: 'Password'}])


