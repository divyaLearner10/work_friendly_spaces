Rails.application.routes.draw do
  devise_for :users
  root to: "renting_spaces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: [:index]
  resources :renting_spaces do
    resources :bookings, only: [:new, :create]
  end
end
