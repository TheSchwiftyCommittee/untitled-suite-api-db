Rails.application.routes.draw do
  # Root route
  root 'untitled#index'

  # Devise Generated routes for users, assigned to custom controller "registrations"
   scope :api, defaults: { format: :json } do
    devise_for :users,  controllers: {
      registrations: 'registrations',
    }
  end

  scope :api, defaults: { format: :json } do
    resources :lists
  end
end


