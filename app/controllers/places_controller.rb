class PlacesController < ApplicationController
  def index
    @places = Place.includes(:user).page params[:page]
  end

  def show
    @place = Place.includes(:user, :type).find(params[:id])

    longitude = @place.longitude
    latitude = @place.latitude
    zoom = 9
    bearing = 0
    geojson = "geojson(%7B%22type%22%3A%22Point%22%2C%22coordinates%22%3A%5B#{longitude}%2C#{latitude}%5D%7D)"
    @map_link = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/#{geojson}/#{longitude},#{latitude},#{zoom},#{bearing}/300x200?access_token=pk.eyJ1IjoibW5ndXllbjgzIiwiYSI6ImNsOGJ0ZDVtMTA5b3k0MXA2eDYwaW93OW4ifQ.RLhT0HdE3NeEsTshFeh9Hg"
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @places = Place.where("name LIKE ?", wildcard_search)
  end
end
