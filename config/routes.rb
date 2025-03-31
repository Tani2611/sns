Rails.application.routes.draw do
  get "/" => "posts#index"
  get "new_form" => "posts#new_form"
  post "new" => "posts#new"

end
