class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  get '/trips' do
    trips = Trip.show_recently_active_trips.limit(10)
    trips.to_json(only: %i[title budget start_date end_date img id], include: {
                    users_trips: { include: :user }
                  })
  end

  get '/trips/:id' do
    trip = Trip.find(params[:id])
    puts trip
    trip.to_json(only: %i[title budget start_date end_date img id], include: {
                   users_trips: { include: :user }
                 })
  end

  delete '/trips/:id' do
    trip_to_delete = Trip.find(params[:id])
    trip_to_delete.destroy
    trip_to_delete.to_json
  end

  get '/users' do
    users = User.show_in_order_of_creation
    users.to_json(include: :users_trips)
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json(include: :users_trips)
  end

  post '/users' do
    user = User.create(
      name: params[:name]
    )
    user.to_json(include: :users_trips)
  end

  post '/userstrips' do
    userstrip = UsersTrip.create(
      user_id: params[:user_id],
      trip_id: params[:trip_id]
    )
    userstrip.to_json(include: :user)
  end
end
