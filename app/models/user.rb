class User < ActiveRecord::Base
  has_many :users_trips
  has_many :trips, through: :users_trips
end
