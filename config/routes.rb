Rails.application.routes.draw do
  
  get '/topics', to: 'topics#index'
  get '/test', to: 'topics#test'
  get '/test/:id', to: 'topics#show'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
