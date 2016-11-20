Rails.application.routes.draw do
  
  root 'home#index'
  
  # Allow custom fields for devise users
  devise_for :users, :controllers => { registrations: 'user_registrations' }

  resources :events do 
      resources :registrations
  end
end
