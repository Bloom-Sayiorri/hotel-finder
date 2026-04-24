class HostsController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    hosts = Host.all
    render json: hosts, status: :ok
  end

  def show
    host = find_host
    render json: host, stauts: :ok
  end

  def create
    host = current_user.hosts.create!(host_params)
    render json: host, status: :created
  end

  def update
    host = find_host
    host.update!
    render json: host, status: :ok
  end

  def destroy
    host = find_host
    host.destroy!
    head :no_content
  end

  private

  def find_host
    current_user.find(paranms[:id])
  end

  def host_params
    params.require(:host).permit(:user_id, :bio, :is_verified, :name, :avatar, :thumbnail_url, :location, :response_time, :response_rate, :acceptance_rate, :is_superhost, :has_profile_pic)
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
