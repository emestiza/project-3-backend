Rails.application.routes.draw do
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/users/:username", to: "users#show"


  resources :budgets do
    resources :expenses
    get "/:category", to: "expenses#category"
  end
end