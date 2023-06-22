Rails.application.routes.draw do

  resources :flights, only: [:index]
  resources :bookings, only: [:new, :create, :show]

  root to: 'flights#index'
end
