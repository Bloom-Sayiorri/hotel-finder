class AddColumnsToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :bathrooms_text, :string
    add_column :listings, :bedrooms, :integer
    add_column :listings, :beds, :integer
  end
end
