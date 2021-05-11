Rails.application.routes.draw do

  resources :dashboards, path: 'dashboard'
  resources :contacts, only: [:new, :create]
  resources :admins, path: 'admin'


  root "events#index"
end
