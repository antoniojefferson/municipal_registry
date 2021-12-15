Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # Routes addresses
   get '/address', to: 'addresses#index'
   get '/address/:_id', to: 'addresses#show'
   post '/address', to: 'addresses#create'
   put '/address/:_id', to: 'addresses#update'

  # Routes citizens
  get '/citizens', to: 'citizens#index'
  get '/citizen/:_id', to: 'citizens#show'
  post '/citizen', to: 'citizens#create'
  put '/citizen/:_id', to: 'citizens#update'
end
