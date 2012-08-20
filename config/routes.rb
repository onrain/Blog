OrangeBlog::Application.routes.draw do
  

  match "subscribes", to: "subscribe#new"


  
  #devise_for :post_auths do
  devise_for :admin_auth do
    get '/post_auths/sign_out' => 'devise/sessions#destroy'
    post '/post_auths/sign_in' => 'devise/sessions#create'
  end

  
  match "posts/subscribes", to: "posts#subscribes"
  match "posts/dosending", to: "posts#dosending"
  
  
  match "posts/edit/comment/:id" => "posts#edit_comment"
  match "posts/update/comment/:id" => "posts#update_comment"
  match "posts/search", to: "posts#search"
  match "posts/update/comment/:id" => "posts#update_comment"
  match "posts/edit/comment/:id" => "posts#edit_comment"
  match "posts/post/new" => "posts#new"
  match "posts/comments" => "posts#comments"
  match "posts/post/published" => "posts#published"
  match "posts/post/npublished" => "posts#npublished"
  #get "posts/edit_comment/:id" => "posts#edit_comment"
  
  match 'auth/:provider/callback', to: 'sessions#create'
  
  match 'auth/failure', to: redirect('/')

  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  match "article/:id" => "comments#show"
  
  
  match "/search", to: "comments#search"
  
  match "home" => "comments#index" 
  
  root :to => 'comments#index'
  

  resources :posts
  
  #resources :post
  
  resources :article
  
  resources :comments
  
  resources :subscribe
  
end
