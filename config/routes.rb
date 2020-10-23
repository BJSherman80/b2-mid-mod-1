Rails.application.routes.draw do
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:id', to: 'mechanics#show'
  get '/parks/:id', to: 'parks#show'
  post '/mechanics/:id/add_ride', to: 'repairs#create'
end
