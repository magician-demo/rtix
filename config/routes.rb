Rails.application.routes.draw do
  
  scope '/dashboard' do
    resources :organizations, except: [:index] do
      member do
        get :events
        get :appropriations
        get :orders
      end
      resources :business_infos, only: [:new, :create]
    end
  end
  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
end
