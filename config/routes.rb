Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # Routes adresses
   get '/adresses', to: 'adresses#index'
   get '/adresses/:_id', to: 'adresses#show'
   post '/adresses', to: 'adresses#create'
   put '/adresses/:_id', to: 'adresses#update'

  # Routes municipes
  get '/municipes', to: 'municipes#index'
  get '/municipes/:_id', to: 'municipes#show'
  post '/municipes', to: 'municipes#create'
  put '/municipes/:_id', to: 'municipes#update'
end
