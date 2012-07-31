OrangeBlog::Application.routes.draw do
  
  devise_for :admin_auths do get '/admin_auths/sign_out' => 'devise/sessions#destroy' end

  
  devise_for :users

  controller :session_admin do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end
  
  

  match "admins/edit/comment/:id" => "admins#edit_comment"
  match "admins/update/comment/:id" => "admins#update_comment"
  match "admins/search", to: "admins#search"
  
  match "admins/update/comment/:id" => "admins#update_comment"
  match "admins/edit/comment/:id" => "admins#edit_comment"
  match "admins/post/new" => "admins#new"
  match "admins/comments" => "admins#comments"
  match "admins/post/published" => "admins#published"
  match "admins/post/npublished" => "admins#npublished"
  #get "admins/edit_comment/:id" => "admins#edit_comment"
  
  match 'auth/:provider/callback', to: 'sessions#create'
  
  match 'auth/failure', to: redirect('/')

  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  match "article/:id" => "comments#show"
  
  match "home" => "comments#index"
  
  root :to => 'comments#index'

  resources :admins
  
  resources :post
  
  resources :article
  
  resources :comments
  
end
