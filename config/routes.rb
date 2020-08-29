Rails.application.routes.draw do
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  get "/users/:username", to: "users#show"
  get "/users/:user_id/budgets/:budget_id/expenses", to: "expenses#expenses_by_user"
  get "/users/:user_id/budgets", to: "budgets#budget_by_user"

  resources :budgets do
    resources :expenses
    get "/category/:category", to: "expenses#category"
  end
end