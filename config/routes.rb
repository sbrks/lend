Rails.application.routes.draw do

  root to: "items#index"

  resources :items, :users


  #create new users
  get '/signup', to: 'users#new', as: 'sign_up'
  post '/users' => 'users#create'

  #user log in, logging in and out
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'


  # handles all unknown requests and sends them home
  get "*path" => "items#index"


end
