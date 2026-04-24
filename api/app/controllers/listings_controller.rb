class ListingsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    listings = Listing.all
    render json: listings, status: :ok
  end

  def show
    listing = find_listing
    render json: listing, status: :ok
  end

  def create
    listing = Listing.create!(listing_params)
    render json: listing, status: :created
  end

  def update
    listing = find_listing
    listing.update!(listing_params)
    render json: listing, status: :ok
  end

  def destroy
    listing = set_listing
    listing.destroy!
    head :no_content
  end

  private

  # def set_listing
  #   Listing.find(params[:id])
  # end
  def set_listing
    Listing.find_by(title: params[:title])
  end

  def listing_params
    params.require(:listing).permit(:category)
  end

  def render_not_found
    render json: { error: 'Listing not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errorrs.full_messages }, status: :not_found
  end

  def render_not_destroyed(exception)
    render json: { error: 'Listing not deleted', details: exception.record.error.full_messages }, status: :not_found
  end
end
