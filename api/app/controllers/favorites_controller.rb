class FavoritesController < ApplicationController
  before_action :find_favorite, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    favorites = Favorite.all
    render json: favorites, status: :ok
  end

  def show
    favorite = find_favorite
    render json: favorite, status: :ok
  end

  def create
    favorite = current_user.favorite.create!(favorite_params)
    render json: favorite, status: :created
  end

  def update
    favorite = currnet_user.find_favorite
    favorite.update!(favorite_params)
    render json: favorite, status: :ok
  end

  def destroy
    favorite = find_favorite
    favorite.destroy!
    head :no_content
  end

  private

  def find_favorite
    current_user.favorites.find(params[:id])
  end

  def favorite_params
    params.require(:favortie).permit(:user_id, :listing_id)
  end

  def render_not_found
    render json: { error: 'User not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errorrs.full_messages }, status: :not_found
  end

  def render_not_destroyed(exception)
    render json: { error: 'User not deleted', details: exception.record.error.full_messages }, status: :not_found
  end
end
