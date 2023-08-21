Rails.application.routes.draw do
  devise_for :users
  root "shops#index"
  
  resources :shops, only: [:show, :index]
  resources :products
  resources :categories
end
