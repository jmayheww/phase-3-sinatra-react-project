class User < ActiveRecord::Base
  has_many :users_trips
  has_many :trips, through: :users_trips
  # class methods
  def self.find_by_name(name)
    where(name: name)
  end

  def self.find_by_id(id)
    where(id: id)
  end

  def self.show_in_order_of_creation
    order(created_at: :desc)
  end

  def self.all_user_names
    all.map(&:name)
  end

  def self.all_names_alphabetical
    all_user_names.sort
  end

  # instance methods
  def all_trips
    trips.all
  end

  def trip_count
    all_trips.count
  end
end
