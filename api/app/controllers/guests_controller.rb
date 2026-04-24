class GuestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    guests = Guest.all
    render json: guests, status: :ok
  end

  def show
    guest = find_guest
    render json: guest, status: :ok
  end

  def create
    guest = Guest.create!(guest_params)
    render json: guest, status: :created
  end

  def update
    guest = find_guest
    guest.update!
    render json: guest, status: :ok
  end

  def destroy
    guest = find_guest
    guest.destroy!
    head :no_content
  end

  private

  def find_guest
    Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:username, :email, :password_digest)
  end

  def render_not_found
    render json: { error: 'Guest not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errorrs.full_messages }, status: :not_found
  end

  def render_not_destroyed(exception)
    render json: { error: 'Guest not deleted', details: exception.record.error.full_messages }, status: :not_found
  end
end
