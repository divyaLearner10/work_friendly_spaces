Rails.application.routes.draw do
  get 'credit_cards/new'
  devise_for :users
  root to: "renting_spaces#home"
  # root to: "renting_spaces#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:index, :destroy]
  resources :renting_spaces do
    resources :bookings, only: [:new, :create]
  end
end
