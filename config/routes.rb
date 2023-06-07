Rails.application.routes.draw do
  devise_for :users
  root to: "renting_spaces#home"
  # root to: "renting_spaces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index]
  resources :renting_spaces do
    resources :bookings, only: [:new, :create]
  end
end
