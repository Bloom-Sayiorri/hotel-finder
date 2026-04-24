class BookingsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    bookings = Booking.all
    render json: bookings, status: :ok
  end

  def show
    booking = find_booking
    render json: booking, status: :ok
  end

  def create
    booking = Booking.create!(booking_params)
    render json: booking, status: :created
  end

  def update
    booking = find_booking
    booking.update!(booking_params)
    render json: booking, status: :ok
  end

  def destroy
    booking = find_booking
    booking.destroy!
    head :no_content
  end

  private

  def find_booking
    Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :listing_id, :starting_date, :end_date, :total_price, :status)
  end

  def render_not_found
    render json: { error: 'Booking not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errorrs.full_messages }, status: :not_found
  end

  def render_not_destroyed(exception)
    render json: { error: 'Booking not deleted', details: exception.record.error.full_messages }, status: :not_found
  end
end
