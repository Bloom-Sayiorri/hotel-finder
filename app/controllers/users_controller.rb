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

  
end
