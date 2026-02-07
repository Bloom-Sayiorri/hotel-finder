class AddMultipleColumnsToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :avatar, :string
    add_column :guests, :role, :integer
  end
end
