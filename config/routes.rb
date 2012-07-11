OrangeBlog::Application.routes.draw do

  
  match "article/:id" => "comments#show"
  
  match "home" => "comments#index"
  
  root :to => 'comments#index'

  resources :admins
  
  resources :article
  
  resources :comments
  
end
