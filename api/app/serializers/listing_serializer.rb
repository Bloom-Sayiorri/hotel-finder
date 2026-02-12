class ListingSerializer < ActiveModel::Serializer
  attributes :id, :host_id, :title, :description, :price, :neighborhood_overview, :picture_url, :neighbourhood,
             :neighbourhood_cleansed, :neighbourhood_group, :lat, :lng, :property_type, :room_type, :accomodates,
             :bathrooms, :amenities, :minimum_nights, :maximum_nights, :availability_30, :availability_60, # rubocop:disable Naming/VariableNumber
             :availability_90, :availability_365, :number_of_reviews, :first_review, :last_review, # rubocop:disable Naming/VariableNumber
             :review_scores_rating, :review_score_accuracy, :review_scores_checkin, :review_scores_cleanliness,
             :review_scores_communication, :review_scores_location, :review_scores_value, :reviews_per_month,
             :instant_bookable, :bathrooms_text, :bedrooms, :beds
end
