Rails.application.routes.draw do
  resources :expressions
  resources :lessons
  resources :users
  get 'sessions/new'

  root 'index#index'

  get 'about', to: 'about#index', as: 'about'
  get 'services', to: 'services#index', as: 'services'
  get 'contact', to: 'contact#index', as: 'contact'

  get '/signup',  to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/admin',  to: 'admin#index', as: 'admin'

  get 'expressions/:lesson_id/new', to: 'expressions#new', as: 'lesson_add_expression'
end
