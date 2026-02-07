class AddMultipleColumnsToListings < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :neighborhood_overview, :text
    add_column :listings, :picture_url, :string
    add_column :listings, :neighbourhood, :string
    add_column :listings, :neighbourhood_cleansed, :string
    add_column :listings, :neighbourhood_group, :string
    add_column :listings, :lat, :float
    add_column :listings, :lng, :float
    add_column :listings, :property_type, :string
    add_column :listings, :room_type, :string
    add_column :listings, :accommodates, :integer
    add_column :listings, :bathrooms, :float
    add_column :listings, :amenities, :text
    add_column :listings, :minimum_nights, :integer
    add_column :listclearings, :maximum_nights, :integer
    add_column :listings, :availability_30, :integer
    add_column :listings, :availability_60, :integer
    add_column :listings, :availability_90, :integer
    add_column :listings, :availability_365, :integer
    add_column :listings, :number_of_reviews, :integer
    add_column :listings, :first_review, :date
    add_column :listings, :last_review, :date
    add_column :listings, :review_scores_rating, :integer
    add_column :listings, :review_scores_accuracy, :integer
    add_column :listings, :review_scores_cleanliness, :integer
    add_column :listings, :review_scores_checkin, :integer
    add_column :listings, :review_scores_communication, :integer
    add_column :listings, :review_scores_location, :integer
    add_column :listings, :review_scores_value, :integer
    add_column :listings, :instant_bookable, :boolean
    add_column :listings, :reviews_per_month, :float
  end
end
