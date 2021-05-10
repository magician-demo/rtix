Rails.application.routes.draw do
  resources :dashboards, path: 'dashboard'

  root "events#index"
end
