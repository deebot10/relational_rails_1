Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #B
  #State routes
  get '/states', to: 'states#index'
  get '/', to: 'welcome#index'


























  #D
  #Artist Routes
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'








end
