Rails.application.routes.draw do
  root "topics#index"

  get '/topics', to: 'topics#index'
  get '/topic/:id', to: 'topics#show'
  get '/usertopic', to: 'topics#usertopic'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
