OrangeBlog::Application.routes.draw do
  

  match "subscribes", to: "subscribe#new"


  
  #devise_for :admin_auths do
  devise_for :admin_auths do
    get '/admin_auths/sign_out' => 'devise/sessions#destroy'
    post '/admin_auths/sign_in' => 'devise/sessions#create'
  end

  
  match "admins/subscribes", to: "admins#subscribes"
  match "admins/dosending", to: "admins#dosending"
  
  
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
  
  
  match "/search", to: "comments#search"
  
  match "home" => "comments#index" 
  
  root :to => 'comments#index'
  

  resources :admins
  
  resources :post
  
  resources :article
  
  resources :comments
  
  resources :subscribe
  
end
