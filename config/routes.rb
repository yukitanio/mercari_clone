Rails.application.routes.draw do
  root "top_pages#index"
  resources :products
  resources :categories, only:[:index]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 
  resources :profiles
  resources :purchases, only:[:index, :update]
  resources :user_products, only:[:index]
  resources :user_products_inprocess, only:[:index]
  resources :user_products_sold, only:[:index]
end
