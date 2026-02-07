class RemoveMultipleColumnsFromListings < ActiveRecord::Migration[7.1]
  def change
    remove_column :listings, :category, :string
    remove_column :listings, :city, :string
    remove_column :listings, :country, :string
    remove_column :listings, :longitude, :float
    remove_column :listings, :latitude, :float
  end
end
