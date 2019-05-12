Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'contents#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/post', to: 'contents#new'
  post '/post', to: 'contents#create'
  patch '/post', to: 'contents#update'
  resources :users
  resources :contents
  get '*path', controller: 'application', action: 'render_404'
end