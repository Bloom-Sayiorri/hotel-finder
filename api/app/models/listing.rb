class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_many :favorites, dependent: :destroy
  has_many :messages
end
