class User < ActiveRecord::Base
  has_many :users_trips
  has_many :trips, through: :users_trips

  def self.find_by_name(name)
    where(name: name)
  end

  def self.find_by_id(id)
    where(id: id)
  end

  def self.show_in_order_of_creation
    order(created_at: :desc)
  end

  def self.show_all_names
    all.map(&:name)
  end

  def self.show_all_names_alphabetical
    show_all_names.sort
  end
end
