Rails.application.routes.draw do
  root 'contents#list'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end