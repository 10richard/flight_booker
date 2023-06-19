Rails.application.routes.draw do

  resources :flights, only: [:index]

  root to: 'flights#index'
end
