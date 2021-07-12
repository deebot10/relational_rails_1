Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  #B
  #States routes
  get '/states', to: 'states#index'
  get '/states/new', to: 'states#new'
  get '/states/:id', to: 'states#show'
  post '/states', to: 'states#create'
  get '/states/:id/edit', to: 'states#edit'
  patch '/states/:id/', to: 'states#update'
  delete '/states/:id', to: 'states#destroy'
  #parks routes
  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'
  #stateparks routes
  get '/states/:state_id/parks', to: 'stateparks#index', as: 'new_state_park'
  get '/states/:state_id/parks/new', to: 'stateparks#new'
  post '/states/:state_id/parks', to: 'stateparks#create'


























  #D
  #Artist Routes
  get '/artists',            to: 'artists#index'
  get '/artists/:id',        to: 'artists#show'
  #Album Routes
  get '/albums',             to: 'albums#index'
  get 'albums/:id',          to: 'albums#show'
  #Hits (Artist_Albums)
  get '/artists/:id/albums', to: 'hits#index'






end
