OrangeBlog::Application.routes.draw do
  



  controller :session_admin do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end
  

  match 'auth/:provider/callback', to: 'sessions#create'
  
  match 'auth/failure', to: redirect('/')

  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  match "article/:id" => "comments#show"
  
  match "home" => "comments#index"
  
  root :to => 'comments#index'

  resources :admins
  
  resources :article
  
  resources :comments
  
end
