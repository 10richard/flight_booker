Rails.application.routes.draw do

  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create]

  root to: 'flights#index'
end
