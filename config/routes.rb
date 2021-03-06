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
  patch '/states/:id', to: 'states#update'
  delete '/states/:id', to: 'states#destroy'
  #parks routes
  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'
  delete '/parks/:id', to: 'parks#destroy'

  #stateparks routes
  get '/states/:state_id/parks', to: 'stateparks#index', as: 'new_state_park'
  get '/states/:state_id/parks/new', to: 'stateparks#new'
  post '/states/:state_id/parks', to: 'stateparks#create'
  # post '/parks', to: 'stateparks#create'


  #D
  # Create an Artist
  get '/artists/new',             to: 'artists#new'
  post '/artists',                to: 'artists#create'
  # Edit an Artist
  get '/artists/:id/edit',        to: 'artists#edit' 
  patch 'artists/:id',            to: 'artists#update'
  #Delete an Artist 
  delete '/artists/:id',          to: 'artists#destroy'
  #Fetch Artist Routes
  get '/artists',                 to: 'artists#index'
  get '/artists/:id',             to: 'artists#show'
  #Album Routes
  get '/albums',                  to: 'albums#index'
  get 'albums/:id',               to: 'albums#show'
  #Hits (Artist_Albums)
  get '/artists/:id/albums',      to: 'hits#index'
  #Create an Artist-Album
  get '/artists/:id/albums/new',  to: 'hits#new'
  post 'artists/:id/albums',      to: 'hits#create'
  #Edit an Album 
  get '/albums/:id/edit',         to: 'albums#edit'
  patch '/albums/:id',            to: 'albums#update'
  #Delete an Album
  delete 'albums/:id',            to: 'albums#destroy'
end
