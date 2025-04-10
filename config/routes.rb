Rails.application.routes.draw do
  get "/" => "posts#index"

  get "post_new" => "posts#new"
  post "post_create" => "posts#create"
  get "post_edit/:id" => "posts#edit"
  post "post_update/:id" => "posts#update"
  post "post_search" => "posts#search"
  delete "post_delete/:id" => "posts#delete"
  
  get "signup_new" => "users#new"
  post "signup_create" => "users#create"
  get "login_form" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"

  get "mypage/:id" => "users#mypage"
  get "mypage_edit/:id" => "users#edit"
  post "mypage_update/:id" => "users#update"
  delete "user_delete/:id" => "users#delete"


  post "follow_in/:id" => "follows#in"
  post "follow_out/:id" => "follows#out"
  get "follower/:id" => "follows#follower"
  get "followed/:id" => "follows#followed"
  
end
