class PlacesController < ApplicationController
  def index
    @places = Place.includes(:user, :type).page params[:page]
  end

  def show
    @place = Place.includes(:user, :type).find(params[:id])

    longitude = @place.longitude
    latitude = @place.latitude
    zoom = 9
    bearing = 0
    geojson = "geojson(%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B#{longitude}%2C#{latitude}%5D%7D)"
    @map_link = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/#{geojson}/#{longitude},#{latitude},#{zoom},#{bearing}/500x400?access_token=pk.eyJ1IjoibW5ndXllbjgzIiwiYSI6ImNsOGJ0ZDVtMTA5b3k0MXA2eDYwaW93OW4ifQ.RLhT0HdE3NeEsTshFeh9Hg"
  end

  def search
    type = params[:type]
    place_search = "%#{params[:keywords]}%"
    if type == ""
      @places = Place.includes(:user, :type).where("name LIKE ?", place_search)
    else
      @places = Place.includes(:user, :type).where("name LIKE ? AND type_id = ?", place_search, type)
      @type = Type.find(type)
    end
  end
end
