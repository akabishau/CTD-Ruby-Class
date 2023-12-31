Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  # resources :pages
  get "/pages", to: "pages#index"
  get "/pages/new", to: "pages#new", as: "new_page"
  get "/pages/:id", to: "pages#show", as: "page"
  get "/pages/:id/edit", to: "pages#edit", as: "edit_page"
  # method, resource, controller's method
  post "pages", to: "pages#create"
  patch "/pages/:id", to: "pages#update"
  delete "/pages/:id", to: "pages#destroy"
end
