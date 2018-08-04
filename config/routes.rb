Rails.application.routes.draw do
 root 'pages#index'
 
 resources :users
 #resources :sessions, :only => [:new, :create, :destroy]
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
end
