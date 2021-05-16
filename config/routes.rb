Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :events do
    resources :booking, only: [:index, :show]
  end
  resources :line_items, only: [:create, :destroy]
  root "events#index"
end
