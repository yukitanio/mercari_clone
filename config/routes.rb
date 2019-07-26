Rails.application.routes.draw do
  root "products#top"
  resources :products
  get "/category_list", to: 'products#category_list'
  post "/product/:id/transaction_status", to: 'products#transaction_status'
end
