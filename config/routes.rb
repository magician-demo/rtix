Rails.application.routes.draw do
  root "events#index"
  devise_for :users

  resources :dashboards, path: 'dashboard'
  resources :contacts, only: [:new, :create]

  resources :admins, path: 'admin'  # Not used yet 
  
  resources :checkins

  resources :organizations
end
