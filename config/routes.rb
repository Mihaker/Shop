Rails.application.routes.draw do
  root "shops#index"

  resources :products
  resources :categories
end
