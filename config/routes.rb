Rails.application.routes.draw do
  get "/" => "posts#index"
  get "post_form" => "posts#post_form"
  post "post/:id" => "posts#post"
  get "login_form" => "users#login_form"
  get "signup_form" => "users#signup_form"
  post "signup" => "users#signup"
  post "login" => "users#login"
  get "logout" => "users#logout"

end
