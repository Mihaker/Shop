Rails.application.routes.draw do
  resources :line_items
  resource :cart, only: [:show]
  devise_for :users
  root "shops#index"
  
  resources :shops, only: [:show, :index]
  resources :products
  resources :categories
end
