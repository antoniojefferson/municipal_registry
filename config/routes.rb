Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Routes citizens
  get '/citizens', to: 'citizens#index'
  get '/citizen/:_id', to: 'citizens#show'
  post '/citizen', to: 'citizens#create'
  put '/citizen/:_id', to: 'citizens#update'
end
