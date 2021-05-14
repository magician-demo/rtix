Rails.application.routes.draw do
  resources :organizations
  devise_for :users
  resources :events do
    resources :booking
  end
  resources :line_items, only: [:create]
  root "events#index"
end
