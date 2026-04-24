class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotDestroyed, with: :render_not_destroyed

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer, status: :ok
  end

  def me
    render json: { users: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    user = User.create!(user_params)
    token = encode_token(user_id: user.id)
    render json: { user: UserSerializer.new(user), jwt: token }, status: :created
  end

  def updated
    user = find_user
    user.update!
    render json: user, stauts: :ok
  end

  def destroy
    user = current_user
    user.destroy!
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :role)
  end

  def find_user
    curernt_user.find(params[:id])
  end

  def render_not_found
    render json: { error: 'User not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { error: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_destroyed(exception)
    render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
