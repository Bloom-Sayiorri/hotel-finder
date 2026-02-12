class BookingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :listing_id, :starting_date, :end_date, :total_price, :status
end
