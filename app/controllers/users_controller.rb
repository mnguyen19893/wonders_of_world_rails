class UsersController < ApplicationController
  def index
    @users = User.includes(:places, :created_places).all
  end

  def show
    @user = User.includes(:places, :created_places).find(params[:id])
  end
end
