class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.string :image_url
      t.string :amenities
      t.integer :rating
      t.integer :listings_id

      t.timestamps
    end
  end
end
