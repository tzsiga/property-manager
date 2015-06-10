# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

propertyList = [
  ["Jedi Temple", 800, "recreation centre, hangar", "academy", 5, "Coruscant"],
  ["Death Star", 10000, "throne room, super laser, hangar", "space station", 5, "in a galaxy, far far away"],
  ["Star Labs", 130, "particle accelerator, secret room", "laboratory", 4, "Central City, Downtown str. 28."],
  ["Batcave", 1, "garage, computer room, armory", "cave", 5, "Gotham, under the Wayne mansion"],
  ["Rivendell", 200, "gardens, recreation room, shrine, library", "outpost", 5, "Middle Earth, Valley of Imladris"],
  ["Winterfell", 50, "stables, prison, forge, bastion", "castle", 3, "Westeros, north"],
  ["Coppola Estate", 30, "armory, kitchen, garage, swimming pool", "mansion", 4, "32166, NY, Little Italy, Via Appia"]
]

propertyList.each do |name, rooms, facilities, category, rating, address|
  Property.create(
    name: name,
    rooms: rooms,
    facilities: facilities,
    category: category,
    rating: rating,
    address: address
  )
end

userList = [
  ["guest@user.com", "Guest", "User"],
  ["test@user.com", "Test", "User"],
  ["test@admin.com", "Test", "Admin"]
]

userList.each do |email, first_name, last_name|
  User.create(
    email: email,
    first_name: first_name,
    last_name: last_name
  )
end

Reservation.create(
  property_id: Property.first.id,
  from: Time.now,
  to: Time.now + (7 * 24 * 3600),
  user_id: User.last.id
)