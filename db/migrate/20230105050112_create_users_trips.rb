class CreateUsersTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :users_trips do |t|
      t.integer :user_id
      t.integer :trip_id
      t.timestamps
    end
  end
end
