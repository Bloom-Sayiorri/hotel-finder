class Guest < ApplicationRecord
  has_many :rooms
  has_secure_password
end
