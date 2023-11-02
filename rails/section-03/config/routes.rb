Rails.application.routes.draw do
  resources :posts
  get "/pages", to: "pages#index"
  get "/pages/:id", to: "pages#show", as: "page"
end
