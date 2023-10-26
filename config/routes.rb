Rails.application.routes.draw do
  root 'users#show'
  get '/profile', to:'users#profile'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users, only: %i[new create edit update show]
  resources :sessions, only: %i[new create destroy]
  resources :items
end
