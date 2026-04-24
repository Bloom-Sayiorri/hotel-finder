class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :user, presence: true
  validates :listing, presence: true
end
