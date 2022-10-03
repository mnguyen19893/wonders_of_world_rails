Rails.application.routes.draw do
  root to: "places#index"
  get 'about', to: "about#index"


  resources :places, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :types, only: [:index, :show]

end
