OrangeBlog::Application.routes.draw do
  
  controller :session_admin do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end
  
 
  #match "admins/:id" => "admins#show"
  match "admins/post/new" => "admins#new"
  match "admins/comments" => "admins#comments"
  match "admins/post/published" => "admins#published"
  match "admins/post/npublished" => "admins#npublished"
  
  
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
