class Trip < ActiveRecord::Base
  has_many :users_trips
  has_many :users, through: :users_trips

  # class methods

  def self.show_all_trip_titles
    all.map(&:title)
  end

  def self.show_trip_titles_by_start_date
    all.order(:start_date).map(&:title)
  end


end
