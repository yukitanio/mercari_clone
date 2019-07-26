Rails.application.routes.draw do
  root "products#top"
  # devise_for :users
  resources :products
  get "/category_list", to: 'products#category_list'
  post "/product/:id/transaction_status", to: 'products#transaction_status'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 
end
