Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'
  root 'contents#list'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end