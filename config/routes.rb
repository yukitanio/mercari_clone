Rails.application.routes.draw do
  root "products#top"
  resources :products
end
