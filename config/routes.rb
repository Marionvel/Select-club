Rails.application.routes.draw do
 root 'pages#index'
 
 resources :users
 #resources :sessions, :only => [:new, :create, :destroy]
 get '/login', to: 'sessions#new'
 post '/login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'

 get '/article', to: 'articles#new'
 post '/article', to: 'articles#create'
 get '/article/:title', to: 'articles#show'
 delete '/article/delete', to: 'articles#destroy'

end
