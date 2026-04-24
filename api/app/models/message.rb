class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :listing

  validates :sender_id, presence: true
  validates :receiver_id, presence: true
  validates :listing_id, presence: true
  validates :content, presence: true, length: { minimum: 4 }
end
