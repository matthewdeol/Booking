Rails.application.routes.draw do
  devise_for :admins
  get 'admin' => 'admin#home'
  get 'admin/bookings' => 'admin#index'
  devise_for :users
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
