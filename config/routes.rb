Rails.application.routes.draw do
  root "top_pages#index"
  resources :products do
    resources :likes, only: %i(create destroy)
  end
  resources :categories, only:%i(index)
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 
  resources :profiles, except: %i(destroy)
  resources :purchases, only: %i(index update)
  resources :user_products, only: %i(index)
  resources :user_products_inprocess, only: %i(index)
  resources :user_products_sold, only: %i(index)
  resources :likes, only: %i(index)
end
