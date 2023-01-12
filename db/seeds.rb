Trip.destroy_all
User.destroy_all
UsersTrip.destroy_all

puts '🌱 Seeding spices...'

# Seed your database here

5.times do
  # create random user names
  User.create(
    name: Faker::Name.name
  )

  trip = Trip.create(
    title: Faker::Address.city,
    budget: rand(0..100),
    start_date: Faker::Date.between(from: '2023-01-01', to: '2023-01-05'),
    end_date: Faker::Date.between(from: '2023-01-10', to: '2023-01-20'),
    img: Faker::LoremFlickr.image(size: '50x60')
  )

  # create between 1 and 3 trips for each user

  rand(1..4).times do
    UsersTrip.create(
      user_id: rand(1..5),
      trip_id: trip.id
    )
  end
end

puts '✅ Done seeding!'
