Rails.application.routes.draw do
  root "top_pages#index"
  resources :categories, only:[:index]
  # get 'categories/index'
  resources :products
  post "/product/:id/transaction_status", to: 'products#transaction_status'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 
end
