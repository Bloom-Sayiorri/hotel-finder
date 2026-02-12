class User < ApplicationRecord
  has_secure_password

  has_one :host, dependent: :destroy
  has_many :bookings
  has_many :reviews
  has_many :favorites, dependent: :destroy
  # has_many :favorite_listings, through: :favorites, source: :listing
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'

  enum :role, { normal: 0, host: 1, admin: 2 }, default: :normal

  validates :username, presence: true
  validates :email,
            presence: true,
            lowercase: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Email is not a valid email address' }
  validates :password_digest, presence: true, length: { minimum: 6, maximum: 20 }
  validates :role, presence: true
end
