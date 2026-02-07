# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# require 'csv'

# MAX_ROWS = 500

# users_file = Rails.root.join('db/data/listings.csv')

# ---------------- USERS ----------------
# puts '🌱 Seeding Users...'
# User.destroy_all

# user_count = 0

# CSV.foreach(users_file, headers: true) do |row|
#   break if user_count >= MAX_ROWS
#   next if row['host_id'].blank?

#   User.find_or_create_by!(external_id: row['host_id']) do |u|
#     u.email = "host#{row['host_id']}@airbnbclone.com"
#     u.password = 'password123'
#     u.username = row['host_name']
#   end

#   user_count += 1
# end

# puts "✅ Users seeded: #{user_count}"

# ---------------- HOSTS ----------------
# puts '🌱 Seeding Hosts...'
# Host.destroy_all

# host_count = 0

# CSV.foreach(users_file, headers: true) do |row|
#   break if host_count >= MAX_ROWS
#   next if row['host_id'].blank?

#   user = User.find_by(external_id: row['host_id'])
#   next unless user

#   Host.find_or_create_by!(user: user) do |h|
#     h.bio              = row['host_about']
#     h.thumbnail_url    = row['host_thumbnail_url']
#     h.avatar           = row['host_picture_url']
#     h.location         = row['host_location']
#     h.response_time    = row['host_response_time']
#     h.response_rate    = row['host_response_rate'].to_s.delete('%').to_i
#     h.acceptance_rate  = row['host_acceptance_rate'].to_s.delete('%').to_i
#     h.is_superhost     = row['host_is_superhost'] == 't'
#     h.has_profile_pic  = row['host_has_profile_pic'] == 't'
#     h.is_verified      = row['host_identity_verified'] == 't'
#   end

#   host_count += 1
# end

# puts "✅ Hosts seeded: #{host_count}"
#
# ---------------- LISTINGS ----------------
# listings_file = Rails.root.join('db/data/listings.csv')
# puts '🌱 Seeding Listings...'
# Listing.destroy_all
# MAX_ROWS = 500
# listing_count = 0

# CSV.foreach(listings_file, headers: true) do |row|
#   break if listing_count >= MAX_ROWS
#   next if row['host_id'].blank? || row['name'].blank?

#   user = User.find_by(external_id: row['host_id'])
#   next unless user

#   host = Host.find_by(user: user)
#   next unless host

#   price = row['price'].to_s.gsub(/[$,]/, '').to_i

#   Listing.create!(
#     host: host,
#     title: row['name'],
#     description: row['description'],
#     neighborhood_overview: row['neighborhood_overview'],
#     picture_url: row['picture_url'],
#     neighbourhood: row['neighbourhood'],
#     neighbourhood_cleansed: row['neighbourhood_cleansed'],
#     neighbourhood_group: row['neighbourhood_group_cleansed'],
#     lat: row['latitude'],
#     lng: row['longitude'],
#     property_type: row['property_type'],
#     room_type: row['room_type'],
#     accommodates: row['accommodates'],
#     bathrooms: row['bathrooms'],
#     bathrooms_text: row['bathrooms_text'],
#     bedrooms: row['bedrooms'],
#     beds: row['beds'],
#     amenities: row['amenities'],
#     price: price,
#     minimum_nights: row['minimum_nights'],
#     maximum_nights: row['maximum_nights'],
#     availability_30: row['availability_30'],
#     availability_60: row['availability_60'],
#     availability_90: row['availability_90'],
#     availability_365: row['availability_365'],
#     number_of_reviews: row['number_of_reviews'],
#     first_review: row['first_review'],
#     last_review: row['last_review'],
#     review_scores_rating: row['review_scores_rating'],
#     review_scores_accuracy: row['review_scores_accuracy'],
#     review_scores_cleanliness: row['review_scores_cleanliness'],
#     review_scores_checkin: row['review_scores_checkin'],
#     review_scores_communication: row['review_scores_communication'],
#     review_scores_location: row['review_scores_location'],
#     review_scores_value: row['review_scores_value'],
#     instant_bookable: row['instant_bookable'] == 't',
#     reviews_per_month: row['reviews_per_month']
#   )
#   puts "Seeded #{listing_count} lists"
#   listing_count += 1
# rescue StandardError => e
#   puts "❌ Skipped row #{row['id']}: #{e.message}"
# end

# puts "✅ Listings seeded: #{listing_count}"

