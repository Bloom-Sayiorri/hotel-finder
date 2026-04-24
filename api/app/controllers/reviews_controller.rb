class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    reviews = Review.all
    render json: reviews, status: :ok
  end

  def show
    review = find_review
    render json: review, status: :ok
  end

  def create
    review = current_user.reviews.create!(review_params)
    render json: review, status: :created
  end

  def updated
    review = find_review
    review.update!
    render json: review, status: :ok
  end

  def destroy
    review = find_review
    review.destroy!
    head :no_content
  end

  private

  def find_review
    current_user.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :listing_id, :rating, :comment)
  end

  def render_not_found
    render json: { error: 'Review not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, stauts: :unprocessable_entity
  end

  def render_not_destroyed(invalid)
    render json: { error: invalid.record.errors.full_messages }, stauts: :unprocessable_entity
  end
end
