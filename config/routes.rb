Rails.application.routes.draw do
  root "shops#index"
  
  resources :shops, only: [:show, :index]
  resources :products
  resources :categories
end
