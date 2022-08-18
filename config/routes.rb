Rails.application.routes.draw do
  get 'topics/index'
  get 'topics/index/:id', to: 'topics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
