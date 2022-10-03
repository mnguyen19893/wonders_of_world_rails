Rails.application.routes.draw do


  root to: "places#index"

  get 'places/index'
  get 'places/show'
  get 'about', to: "about#index"
end
