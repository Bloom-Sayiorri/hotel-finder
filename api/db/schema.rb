# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_260_210_071_251) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'bookings', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'listing_id', null: false
    t.string 'starting_date'
    t.string 'end_date'
    t.integer 'total_price'
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['listing_id'], name: 'index_bookings_on_listing_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'listing_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['listing_id'], name: 'index_favorites_on_listing_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'hosts', force: :cascade do |t|
    t.bigint 'user_id', null: false
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
    t.index ['user_id'], name: 'index_hosts_on_user_id'
  end

  create_table 'listings', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'host_id', null: false
    t.string 'title'
    t.text 'description'
    t.integer 'price'
    t.text 'neighborhood_overview'
    t.string 'picture_url'
    t.string 'neighbourhood'
    t.string 'neighbourhood_cleansed'
    t.string 'neighbourhood_group'
    t.float 'lat'
    t.float 'lng'
    t.string 'property_type'
    t.string 'room_type'
    t.integer 'accommodates'
    t.float 'bathrooms'
    t.text 'amenities'
    t.integer 'minimum_nights'
    t.integer 'maximum_nights'
    t.integer 'availability_30'
    t.integer 'availability_60'
    t.integer 'availability_90'
    t.integer 'availability_365'
    t.integer 'number_of_reviews'
    t.date 'first_review'
    t.date 'last_review'
    t.integer 'review_scores_rating'
    t.integer 'review_scores_accuracy'
    t.integer 'review_scores_cleanliness'
    t.integer 'review_scores_checkin'
    t.integer 'review_scores_communication'
    t.integer 'review_scores_location'
    t.integer 'review_scores_value'
    t.boolean 'instant_bookable'
    t.float 'reviews_per_month'
    t.string 'bathrooms_text'
    t.integer 'bedrooms'
    t.integer 'beds'
    t.index ['host_id'], name: 'index_listings_on_host_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.bigint 'sender_id', null: false
    t.bigint 'receiver_id', null: false
    t.bigint 'listing_id', null: false
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['listing_id'], name: 'index_messages_on_listing_id'
    t.index ['receiver_id'], name: 'index_messages_on_receiver_id'
    t.index ['sender_id'], name: 'index_messages_on_sender_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'listing_id', null: false
    t.integer 'rating'
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['listing_id'], name: 'index_reviews_on_listing_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'role', default: 0, null: false
    t.string 'bio'
    t.string 'avatar'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'bookings', 'listings'
  add_foreign_key 'bookings', 'users'
  add_foreign_key 'favorites', 'listings'
  add_foreign_key 'favorites', 'users'
  add_foreign_key 'hosts', 'users'
  add_foreign_key 'listings', 'hosts'
  add_foreign_key 'messages', 'listings'
  add_foreign_key 'messages', 'users', column: 'receiver_id'
  add_foreign_key 'messages', 'users', column: 'sender_id'
  add_foreign_key 'reviews', 'listings'
  add_foreign_key 'reviews', 'users'
end
