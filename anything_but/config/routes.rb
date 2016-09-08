Rails.application.routes.draw do
  root "welcome#index"

  resources :users

  resources :recommendations, only: [:create, :show]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

end
