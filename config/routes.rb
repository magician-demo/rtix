Rails.application.routes.draw do

  resources :dashboards, path: 'dashboard'

  get '/mockup', to: 'dashboards#mockup'
  # :show route will be returned to the default once the ticket route is ready


  resources :contacts, only: [:new, :create]
  resources :admins, path: 'admin'


  root "events#index"
end
