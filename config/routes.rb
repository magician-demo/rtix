Rails.application.routes.draw do

  root "events#index"
  devise_for :users

  
  resources :dashboards, path: 'dashboard'


  resources :organizations

  resources :events do
    resources :booking, only: [:index, :show]
  end

  resources :line_items, only: [:create, :destroy]
    post '/line_items/random_create', to: 'line_items#random_create'
  resource :carts, only: [:destroy]


  resources :contacts, only: [:new, :create]

  resources :admins, path: 'admin'  # Not used yet 
  
  resources :checkins
end
