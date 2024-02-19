class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = find_user
    if @user.present?
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :not_found
    end
  end

  def destroy
    @user = find_user
    if @user
      @user.destroy
      head :no_content
    else
      render json: @user.errors, status: :not_found
    end
  end

  private
  def find_user
    User.find(params[:id])
  end
end
