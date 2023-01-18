Trip.destroy_all
User.destroy_all
UsersTrip.destroy_all

puts '🌱 Seeding spices...'

# Seed your database here
num_users = 7

num_users.times do
  # create random user names
  User.create(
    name: Faker::Name.name
  )

  trip = Trip.create(
    title: Faker::Address.city,
    budget: rand(0..100),
    start_date: Faker::Date.between(from: '2023-01-01', to: '2023-01-05'),
    end_date: Faker::Date.between(from: '2023-01-10', to: '2023-01-20'),
    img: Faker::LoremFlickr.image(size: '300x200')
  )

  # create between 1 and 3 trips for each user
  (1..num_users).to_a.each do |item|
    UsersTrip.create(
      user_id: item,
      trip_id: trip.id
    )
  end
end

puts '✅ Done seeding!'
