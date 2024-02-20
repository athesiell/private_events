Rails.application.routes.draw do
  devise_for :users
  root "events#index"
  resources :events do
    resources :bookings, only: [:create, :destroy]
  end
  resources :bookings, only: [:create, :destroy]
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
