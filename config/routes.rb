Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'
  resources :animals, only: [:index, :create, :new, :show] do
    resources :bookings, only: [:index, :create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
