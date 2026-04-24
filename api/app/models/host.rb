class Host < ApplicationRecord
  belongs_to :user
  has_many :listings

  validates :user_id, presence: true
  validates :listings, presence: true
    t.text 'bio'
    t.boolean 'is_verified'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.string 'avatar'
    t.string 'thumbnail_url'
    t.string 'location'
    t.string 'response_time'
    t.integer 'response_rate'
    t.integer 'acceptance_rate'
    t.boolean 'is_superhost'
    t.boolean 'has_profile_pic'
end
