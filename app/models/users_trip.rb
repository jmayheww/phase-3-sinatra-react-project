class UsersTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  def self.all_user_trip_pairings
    all.map { |usertrip| "#{usertrip.user.name} :  #{usertrip.trip.title}" }.sort
  end

  def self.users_trips_by_creation
    order(created_at: :desc)
  end

  def user_trip_confirmation_message
    "Congratulations, #{user.name}. Your trip, #{trip.title}, is successfully planned and confirmed for
      the following dates: #{trip.start_date} - #{trip.end_date}.
      Enjoy your travels! Adventure and excitement await!"
  end
end
