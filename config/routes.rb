Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles#, only: [:show, :index, :new, :create, :edit, :update, :destroy] # comented section use for specific route
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]

  get   'password/reset', to: 'password_resets#new', as: 'new_password_reset'
  post  'password/reset', to: 'password_resets#create', as: 'password_reset'
  get   'password/reset/edit', to: 'password_resets#edit', as: 'edit_password_reset'
  patch 'password/reset/edit', to: 'password_resets#update', as: 'update_password_reset'
end
