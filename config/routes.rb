Rails.application.routes.draw do
  root "products#top"
  get 'products/index'
end
