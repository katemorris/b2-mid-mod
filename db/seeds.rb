# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mechanic.delete_all
Ride.delete_all
Park.delete_all
RideMechanic.delete_all

@bob = Mechanic.create!(
  name: 'Bob Knife',
  years_exp: 15
)
@sue = Mechanic.create!(
  name: 'Sue Markell',
  years_exp: 10
)
@six_flags = Park.create!(
  name: 'Six Flags',
  price: 35.50
)
@nitro = Ride.create!(
  name: 'Nitro',
  thrill_rating: 8,
  park_id: @six_flags.id
)
@skull_mountain = Ride.create!(
  name: 'Skull Mountain',
  thrill_rating: 4,
  park_id: @six_flags.id
)
@toro = Ride.create!(
  name: 'El Toro',
  thrill_rating: 8,
  park_id: @six_flags.id
)
sue_nitro = RideMechanic.create!(mechanic: @sue, ride: @nitro)
sue_toro = RideMechanic.create!(mechanic: @sue, ride: @toro)
bob_skull = RideMechanic.create!(mechanic: @bob, ride: @skull_mountain)
bob_nitro = RideMechanic.create!(mechanic: @bob, ride: @nitro)
