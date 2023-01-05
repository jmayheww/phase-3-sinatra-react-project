class CreateTravelPlans < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_plans do |t|
      t.string :title
      t.integer :budget
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
