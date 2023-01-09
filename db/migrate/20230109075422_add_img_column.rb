class AddImgColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :img, :string
  end
end
