class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :messages

  validates :host_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :neighborhood_overview, presence: true
  validates :picture_url, presence: true
  validates :neighbourhood, presence: true
  validates :neighbourhood_cleansed, presence: true
  validates :neighbourhood_group, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :property_type
  validates :room_type, presence: true
  validates :accommodates, presence: true
  validates :bathrooms, presence: true
  validates :amenities, presence: true
  validates :minimum_nights, presence: true
  validates :maximum_nights, presence: true
  validates :availability_30, presence: true
  validates :availability_60, presence: true
  validates :availability_90, presence: true
  validates :availability_365, presence: true
  validates :number_of_reviews, presence: true
  validates :first_review, presence: true
  validates :last_review, presence: true
  validates :review_scores_rating, presence: true
  validates :review_scores_accuracy, presence: true
  validates :review_scores_checkin, presence: true
  validates :review_scores_cleanliness, presence: true
  validates :review_scores_communication, presence: true
  validates :review_scores_location, presence: true
  validates :review_scores_value, presence: true
  validates :reviews_per_month, presence: true
  validates :instant_bookable, presence: true
  validates :bathrooms_text, presence: true
  validates :bedrooms, presence: true
  validates :beds, presence: true
end
