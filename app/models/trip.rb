class Trip < ActiveRecord::Base
  has_many :users_trips
  has_many :users, -> { distinct }, through: :users_trips

  # class methods

  def self.show_all_trip_titles
    all.map(&:title)
  end

  def self.show_recently_active_trips
    all.order(updated_at: :desc)
  end

  def self.show_trip_titles_by_start_date
    all.order(:start_date).map(&:title)
  end

  def self.show_all_unique_users
    all.map(&:users)
  end

  def self.find_trip_by_budget(budget)
    where(budget: budget)
  end

  def self.lowest_budget
    minimum(:budget)
  end

  def self.highest_budget
    maximum(:budget)
  end

  def self.most_affordable
    where(budget: lowest_budget)
  end

  def self.most_luxurious
    where(budget: highest_budget)
  end

  # instance methods

  def users_trips_by_creation
    users_trips.order(created_at: :desc)
  end

  def participating_users
    users.all.map(&:name)
  end
end
