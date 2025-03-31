Rails.application.routes.draw do
  get "/" => "posts#index"
  get "new_form" => "posts#new_form"
  post "new" => "posts#new"
  get "login_form" => "users#login_form"
  get "signup_form" => "users#signup_form"
  post "signup" => "users#signup"

end
