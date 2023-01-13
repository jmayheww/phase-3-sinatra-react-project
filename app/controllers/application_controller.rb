class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Add your routes here
  get '/' do
    { message: 'Good luck with your project!' }.to_json
  end

  get '/trips' do
    trips = Trip.show_recently_active_trips.limit(10)
    trips.to_json(only: %i[id img title budget start_date end_date], include: {
                    users_trips: { only: %i[created_at updated_at], include: :user }
                  })
  end

  get '/trips/:id' do
    trip = Trip.find(params[:id])
    trip.to_json(only: %i[title budget start_date end_date img id], include: {
                   users_trips: { only: %i[created_at updated_at], include: :user }
                 })
  end
end
