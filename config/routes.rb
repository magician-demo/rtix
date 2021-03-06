require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails
  .application
  .routes
  .draw do
    root to: 'events#index'
    get '/contacts', to: 'events#contacts'
    devise_for :users,
               controllers: {
                 omniauth_callbacks: 'users/omniauth_callbacks',
               }

    resources :dashboards, path: 'dashboard', only: %i[index show] do
      collection do
        resources :organizations, except: %i[show index] do
          member do
            get :info
            get :events
            get :publish
            get :pending 
          end
        end
      end

      member do
        get :contact, controller: :dashboards, action: 'new'
        post :contact, controller: :dashboards, action: 'create'
      end

      get 'mailing/:id',
          controller: :mailings,
          action: 'write_email',
          as: 'mailing'
      post 'mailing/:id', controller: :mailings, action: 'send_email'
    end

    resources :events do
      collection { get :tag }
      collection { get 'search', to: 'events#search' }
      resources :booking, only: %i[index show]
      resources :tickets, only: %i[new create edit update]
    end

    resources :organizations, only: [:show]

    resources :line_items, only: %i[create destroy] do
      collection do
        post :random_create
        get :ticket_list
      end
    end

    resource :carts, only: [:destroy]

    delete '/carts/empty', to: 'carts#empty_cart'

    resource :cart, only: %i[show destroy] do
      collection { get :checkout }
    end

    resources :checkin, only: %i[show update] do
      collection do
        get 'checkin_list/:id', to: 'checkin#checkin_list', as: :list
      end
    end

    resources :orders, only: %i[show create update] do
      collection { post :return_url }
    end
    mount Sidekiq::Web => '/sidekiq'

    get 'overtime', to: 'overtime#index'
  end
