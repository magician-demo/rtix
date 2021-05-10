Rails.application.routes.draw do
  resources :dashboards, path: 'dashboard'

  resources :admins, path: 'admin'

  root "events#index"
end
