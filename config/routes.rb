Rails.application.routes.draw do
  root 'searches#show'

  resources :trains do
    resources :carriages
  end

  resources :railway_stations do
    patch :update_strip_map, on: :member
  end

  resources :routes
  resource  :search, only: [:show, :create]
  resources :tickets, only: [:show, :create, :destroy] do
    post :purchase, on: :collection
  end
end
