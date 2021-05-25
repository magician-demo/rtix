require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails
  .application
  .routes
  .draw do
    root 'events#index'
    devise_for :users

    resources :dashboards, path: 'dashboard', only: %i[index show] do
      member do
        get :contact, controller: :dashboards, action: 'new'
        post :contact, controller: :dashboards, action: 'create'
      end
    end

    resources :organizations

    resources :events do
      resources :booking, only: %i[index show]
    end

    resources :line_items, only: %i[create destroy] do
      collection { post :random_create }
    end

    resource :carts, only: [:destroy]

    delete '/carts/empty', to: 'carts#empty_cart'

    resource :cart, only: %i[show destroy] do
      collection { get :checkout }
    end

    

    resources :orders, only: %i[show create] do
      collection { post :return_url }
    end
    mount Sidekiq::Web => '/sidekiq'
  end
