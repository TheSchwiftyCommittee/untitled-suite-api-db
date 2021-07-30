Rails.application.routes.draw do
 
  scope '/users' do
    resource :users, only: [:create, :login]
    post "/login", to: "users#login"
    put"/update", to: "users#update"
    get "/auto_login", to: "user#auto_login"
  end

  scope '/admin' do
    get "/user_index", to: "admins#user_index"
    delete "/delete_user", to: "admins#delete_user"
    put"/assign_user", to: "admins#assign_user"
  end

  resources :lists

end


