class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users_trips, %i[user_id trip_id], unique: true
  end
end
