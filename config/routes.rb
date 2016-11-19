Rails.application.routes.draw do
  
  devise_for :users
  root 'home#index'
  
  resources :events do 
      resources :registrations
  end
end
