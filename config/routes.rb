Rails.application.routes.draw do
  devise_for :users
  root to: 'animals#index'

  resources :users, only: [:show, :update] do
    member do
      resources :bookings, only: [:index]
    end
  end

  resources :animals, only: []
  resources :animals, only: [:index, :show, :create, :new, :edit, :update] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
