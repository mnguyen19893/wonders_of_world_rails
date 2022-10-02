require 'csv'
require 'faker'

Place.delete_all
User.delete_all
Type.delete_all
UserPlace.delete_all

# Create users
100.times do
  User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20),
    bio: Faker::Lorem.paragraphs(number: 2)
  )
end

# Create Type and Places
csv_file = Rails.root.join('db/wonders_of_world.csv')
csv_data = File.read(csv_file)
places = CSV.parse(csv_data, headers: true)

places.each do |place|
  type = Type.find_or_create_by(name: place['type'])
  if type && type.valid?
    my_place = type.places.new(
      name: place['name'],
      latitude: place['latitude'],
      longitude: place['longitude'],
      location: place['location'],
      wikipedia_link: place['wikipedia_link'],
      picture_link: place['picture_link'],
      build_in_year: place['build_in_year']
    )
    my_place.user = User.find(rand(1..50))
    my_place.save

    puts "Invalid place #{place['name']}" unless my_place.valid?
  end
end

# Create User_Places data
100.times do
  UserPlace.create(
    user_id: rand(1..100),
    place_id: rand(1..50)
  )
end