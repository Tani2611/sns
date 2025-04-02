Rails.application.routes.draw do
  get "/" => "posts#index"

  get "post_form" => "posts#post_form"
  post "post" => "posts#post"
  delete "post_delete/:id" => "posts#delete"

  get "signup_form" => "users#signup_form"
  post "signup" => "users#signup"
  get "login_form" => "users#login_form"
  post "login" => "users#login"
  get "logout" => "users#logout"
  get "mypage/:id" => "users#mypage"
  get "mypage_edit/:id" => "users#mypage_edit"
  post "mypage_update/:id" => "users#mypage_update"
  delete "user_delete/:id" => "users#delete"
  

end
