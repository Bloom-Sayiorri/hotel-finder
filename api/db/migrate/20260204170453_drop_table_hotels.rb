class DropTableHotels < ActiveRecord::Migration[7.1]
  def change
    drop_table :hotels
  end
end
