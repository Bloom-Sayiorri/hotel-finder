class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender_id, :receiver_id, :listing_id, :content
end
