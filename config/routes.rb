Rails.application.routes.draw do
  
  root 'home#index'
  
  # Allow custom fields for devise user registration
  devise_for :users, :controllers => { registrations: 'user_registrations' }
  
  # route to user profile page
  resources :users, only: [:show]
  
  # route to manage user's events
  get "/users/:id/manage_events" => "users#manage_events", :as => :manage_events
  
  resources :events do  
      resources :registrations
  end
end
