Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  #B
  #State routes
  get '/states', to: 'states#index'
  get '/states/:id', to: 'states#show'
  get '/parks', to: 'parks#index'
  # get '/parks/:id', to: 'parks#show'

























  #D
  #Artist Routes
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'








end
