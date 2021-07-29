Rails.application.routes.draw do
  # Root route
  root 'untitled#index'

  # Devise Generated routes for users, assigned to custom controller "registrations"
   
    devise_for :users,  controllers: {
      registrations: 'registrations',
    }

    resources :lists

end


