Rails.application.routes.draw do
  root to: "places#index"
  get 'about', to: "about#index"

  resources :places, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  resources :users, only: [:index, :show]
  resources :types, only: [:index, :show]

end
