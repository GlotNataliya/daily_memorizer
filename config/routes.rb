Rails.application.routes.draw do
  resources :topics
  resources :customers
  # devise_scope :user do
  #   # Redirests signing out users back to sign-in
  # get "users", to: "devise/sessions#new"
  # end
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    registrations: 'users/registrations' }

  root 'landing_page#index'
end
