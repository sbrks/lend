Rails.application.routes.draw do

  resources :locations, :items, :users, :mailbox


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

  # mailbox folder routes
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash

    # conversations
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
  end

end
