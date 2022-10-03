class PlacesController < ApplicationController
  def index
    @places = Place.includes(:user).all
  end

  def show
    @place = Place.includes(:user, :type).find(params[:id])
  end
end
