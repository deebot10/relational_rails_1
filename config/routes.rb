Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  #B
  #State routes
  get '/states', to: 'states#index'
  get '/states/:id', to: 'states#show'
  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'
  get '/states/:id/parks', to: 'stateparks#index'

























  #D
  # Create an Artist
  get '/artists/new',             to: 'artists#new'
  post '/artists',                to: 'artists#create'
  # Edit an Artist
  get '/artists/:id/edit',        to: 'artists#edit' 
  patch 'artists/:id',            to: 'artists#update'
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
end
