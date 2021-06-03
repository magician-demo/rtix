require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails
  .application
  .routes
  .draw do

    root to: "events#index"
    get "/contacts", to: "events#contacts"
    devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

    resources :dashboards, path: 'dashboard', only: %i[index show] do
      collection do
        resources :organizations, except: [:show, :index] do
          member do
            get :info
            get :events
            get :appropriations
            get :orders
            get :publish
            get :pending
          end
          resources :business_infos, only: [:new, :create]
        end
      end

      member do
        get :contact, controller: :dashboards, action: 'new'
        post :contact, controller: :dashboards, action: 'create'
      end

      get "mailing/:id", controller: :mailings, action: 'write_email', as: "mailing"
      post "mailing/:id", controller: :mailings, action: 'send_email'

    end

    resources :events do
      
      resources :booking, only: %i[index show]
      resources :tickets, only: [:new, :create, :edit, :update]
    end



  resources :events do
    resources :booking, only: %i[index show]
    resources :tickets, only: [:new, :create, :edit, :update]
  end

    

  resources :organizations, only: [:show]

  resources :line_items, only: %i[create destroy show] do
    collection { post :random_create }
  end

    resource :carts, only: [:destroy]

    delete '/carts/empty', to: 'carts#empty_cart'

    resource :cart, only: %i[show destroy] do
      collection { get :checkout }
    end

    resources :checkin, only: %i[show update] do
        collection { get 'checkin_list/:id', to: 'checkin#checkin_list', as: :list }
    end

    resources :orders, only: %i[show create update] do
      collection { post :return_url }
    end
    mount Sidekiq::Web => '/sidekiq'
  end
