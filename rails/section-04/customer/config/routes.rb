Rails.application.routes.draw do
  resources :customers
  resources :orders
  root "customers#index"
end
