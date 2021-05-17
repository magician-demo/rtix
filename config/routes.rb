Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :events do
    resources :booking, only: [:index, :show]
  end
  resources :line_items, only: [:create, :destroy]
  get '/line_items/empty', to: 'line_items#empty_cart'
  root "events#index"

  resources :orders, only: [:show, :create]
end
