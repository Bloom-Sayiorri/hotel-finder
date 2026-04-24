class MessagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    messages = Message.all
    render json: messages, status: :ok
  end

  def show
    message = find_message
    render josn: message, stauts: :ok
  end

  def create
    message = current_user.messages.create!(message_params)
    render json: message, status: :created
  end

  def update
    message = find_message
    message.update!(message_params)
    render json: message, status: :ok
  end

  def destroy
    message = find_message
    message.destroy!
    head :no_content
  end

  private

  def find_message
    current_user.messages.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:sender_id, :receiver_id, :listing_id, :content)
  end

  def render_not_found
    render json: { error: 'Message not found' }, stauts: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_destroyed(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
end
