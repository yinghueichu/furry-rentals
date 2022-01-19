Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: :show do
    member do
      resources :bookings, only: :index
    end
  end


  resources :bookings do
    member do
      resources :reviews, only: [:new, :create]
    end
  end

  resources :animals do
    collection do
      get :my_animals
    end
  end

  resources :animals do
    member do
      get :show_available
    end
  end

  resources :animals, only: [:index, :show, :create, :new, :edit, :update] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
