class RenameTravelPlansToTrips < ActiveRecord::Migration[6.1]
  def change
    rename_table :travel_plans, :trips
  end
end
