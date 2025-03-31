class UsersController < ApplicationController
  def signup_form
    @users = User.all
  end
  def signup
    @signup = User.new(email: params[:email], password: params[:password])
    @signup.save
    redirect_to("/signup_form")
  end


  def login_form
  end
end
