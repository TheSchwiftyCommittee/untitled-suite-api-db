Rails.application.routes.draw do
 
  resources :profiles
  scope '/users' do
    resource :users, only: [:create, :login]
    post "/login", to: "users#login"
    put"/update", to: "users#update"
    get "/auto_login", to: "users#auto_login"
  end

  scope '/admins' do
    get "/user_index", to: "admins#user_index"
    delete "/delete_user", to: "admins#delete_user"
  end

  scope '/admin_directors' do
    get "/user_index", to: "admin_directors#user_index"
    delete "/delete_user", to: "admin_directors#delete_user"
    delete "/delete_admin", to: "admin_directors#delete_admin"
    put"/assign_admin", to: "admin_directors#assign_admin"
    put"/unassign_admin", to: "admin_directors#unassign_admin"
  end

  resources :lists

end


