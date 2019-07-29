Rails.application.routes.draw do
  root "top_pages#index"
  resources :products
  resources :categories, only:[:index]
  resources :purchases, only:[:update]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  } 
end
