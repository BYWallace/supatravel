# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([
  {title: 'Visiting Washington DC', story: 'I visited Washington DC. It was GREAT! I especially liked visiting General Assembly! They have GREAT peanut butter and jelly sandwiches!', location: 'Washington DC', latitude: 38.8951, longitude: -77.0367, user_id: 0 }

])
