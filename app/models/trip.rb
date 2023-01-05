class Trip < ActiveRecord::Base
  has_many :users_trips
  has_many :users, through: :users_trips
end
