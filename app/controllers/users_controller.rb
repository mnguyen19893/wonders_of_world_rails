class UsersController < ApplicationController
  def index
    @users = User.includes(:places).all
  end

  def show
  end
end
