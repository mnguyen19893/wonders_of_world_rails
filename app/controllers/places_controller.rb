class PlacesController < ApplicationController
  def index
    @places = Place.includes(:user).page params[:page]
  end

  def show
    @place = Place.includes(:user, :type).find(params[:id])
  end
end
