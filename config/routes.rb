Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  
  resource :cart, only: [:show]
  resources :categories
  resources :products
  resources :users, only: [:index, :update]
  resources :orders, only: [:new, :create, :index, :show]
  resources :shops, only: [:show, :index]
  resources :line_items

  post 'checkout/create', to: 'checkout#create'
  get 'checkout/success' 
  get 'checkout/cancel'
  
  devise_for :users

  root "shops#index"
end
