class HostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :bio, :avatar, :thumbnail_url, :location, :response_time, :response_rate, :acceptance_rate,
             :is_verified, :is_superhost, :has_profile_pic
end
