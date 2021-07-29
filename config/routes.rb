Rails.application.routes.draw do
  resources :lists

  resource :users, only: [:create, :login]
  post "/login", to: "users#login"
  get "/auto_login", to: "user#auto_login"
end
