Rails.application.routes.draw do
  resources :lists

  scope '/users' do
    resource :users, only: [:create, :login]
    post "/login", to: "users#login"
    put"/update", to: "users#update"
    get "/auto_login", to: "user#auto_login"
    get "/admin_index", to: "users#admin_index"
    delete "/admin_delete_user", to: "users#admin_delete_user"
    put"/admin_assign_user", to: "users#admin_assign_user"
  end
end


