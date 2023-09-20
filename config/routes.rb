Rails.application.routes.draw do

  resource :cart, only: [:show]
  resources :categories
  resources :products

  resources :orders, only: [:new, :create, :index, :show]
  resources :shops, only: [:show, :index]
  resources :line_items

  post 'checkout/create', to: 'checkout#create'
  get 'checkout/success' 
  get 'checkout/cancel'
  
  devise_for :users

  root "shops#index"
end
