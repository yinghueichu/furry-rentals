Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :animals, only: [:index, :create, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :bookings, only: [ :index, :create, :show ]
end
