class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  has_many :listings
  belongs_to :user

  validates :user_id, uniqueness: { scope: :listing_id }
end
