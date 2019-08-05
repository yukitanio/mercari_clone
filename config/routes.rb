Rails.application.routes.draw do
  root "top_pages#index"
  resources :products do
    resources :likes, only:[:create, :destroy]
  end
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
  resources :likes, only:[:index]
end
