class UsersTrip < ActiveRecord::Base
  belongs_to :user
  belongs_to :trip

  def user_trip_confirmation_message
    "Congratulations, #{user.name}. Your trip, #{trip.title}, is successfully planned and confirmed for
      the following dates: #{trip.start_date} - #{trip.end_date}.
      Enjoy your travels! Adventure and excitement await!"
  end
end
