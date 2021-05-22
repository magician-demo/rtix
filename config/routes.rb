Rails.application.routes.draw do

  root "events#index"
  devise_for :users

  
  resources :dashboards, path: 'dashboard', only: [:index, :show, :create] do 
    member do 
      get :contact, controller: :dashboards, action: 'new'
      post :contact, controller: :dashboards, action: 'create'
    end
  end

  resources :organizations

  resources :events do
    resources :booking, only: [:index, :show]
  end

  resources :line_items, only: [:create, :destroy]
    post '/line_items/random_create', to: 'line_items#random_create'
  resource :carts, only: [:destroy]


  resources :admins, path: 'admin'  # Not used yet 
  
  resources :checkins

  resource :cart, only: [:show, :destroy] do
    collection do
      get :checkout
    end
  end

  delete "/carts/empty", to: 'carts#empty_cart'

  resources :orders, only: [:show, :create] do
    collection do
      post :return_url
    end
  end
  
end
