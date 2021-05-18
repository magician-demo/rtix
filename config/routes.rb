Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :events do
    resources :booking, only: [:index, :show]
  end
  resources :line_items, only: [:create, :destroy]
    delete '/line_items', to: 'line_items#empty_cart'
    post '/line_items/random_create', to: 'line_items#random_create'
  root "events#index"
end
