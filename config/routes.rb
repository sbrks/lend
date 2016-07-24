Rails.application.routes.draw do

  resources :locations, :items, :users
  root to: "home#index"

  get '/', to: 'home#index'

  get '/contact', to: 'home#contact'

  get '/about', to: 'home#about'

  get '/items/:id/borrow', to: 'items#borrow'

  get '/faq', to: 'home#faq'




  #create new users
  get '/signup', to: 'users#new', as: 'sign_up'
  post '/users' => 'users#create'

  #user log in, logging in and out
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create'
  delete '/sessions', to: 'sessions#destroy'

#conversation/message routes
  resources :conversations do
    resources :messages
  end

#friendship routes
get  '/users/:id', to: 'friendships#show', as: 'show_friendship'
  post '/users/:id/request', to: 'friendships#add', as: 'request'
  post '/users/:id/accept', to: 'friendships#accept', as: 'accept'
  post '/users/:id/decline', to: 'friendships#decline', as: 'decline'
  post '/users/:id/remove', to: 'friendships#remove', as: 'remove'
  post '/users/:id/block', to: 'friendships#block', as: 'block'
  post '/users/:id/unblock', to: 'friendships#unblock', as: 'unblock'
  
  # handles all unknown requests and sends them home
  get "*path" => "items#index"


end
