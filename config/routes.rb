Rails.application.routes.draw do
  root 'contents#list'
  # get '/list', to:'contents#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
