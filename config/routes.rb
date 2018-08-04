Rails.application.routes.draw do
 root 'pages#index'
 #get 'user/:id', to: 'users#show'
 resources :users

end
