Rails.application.routes.draw do

  resources :locations, :items, :users
  root to: "home#index"

  get '/', to: 'home#index'

  get '/contact', to: 'home#contact'

  get '/about', to: 'home#about'




  #create new users
  get '/signup', to: 'users#new', as: 'sign_up'
  post '/users' => 'users#create'

  #user log in, logging in and out
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'


  # handles all unknown requests and sends them home
  get "*path" => "items#index"


end
