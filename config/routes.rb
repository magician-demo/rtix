Rails.application.routes.draw do
<<<<<<< HEAD

  resources :dashboards, path: 'dashboard'

  get '/mockup', to: 'dashboards#mockup'
  # :show route will be returned to the default once the ticket route is ready


  resources :contacts, only: [:new, :create]
  resources :admins, path: 'admin'


=======
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
>>>>>>> db834d852b2ef75d89c8e1cf319d48eb6b4deed7
  root "events#index"
end
