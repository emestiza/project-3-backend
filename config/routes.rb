Rails.application.routes.draw do
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  resources :budgets do
    resources :expenses
  end
end