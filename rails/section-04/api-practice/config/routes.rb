Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
  get "/test", to: "test#show"

  # controller namespace: Api::V1 (capitalized) and path: api/v1 (lowercase
  namespace :api do
    namespace :v1 do
      resources :members do
        resources :facts
      end
    end
  end
end
