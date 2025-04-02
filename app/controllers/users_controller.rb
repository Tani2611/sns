class UsersController < ApplicationController
  def signup_form
    @users = User.all
  end
  def signup
    @signup = User.new(name: params[:name], email: params[:email], password: params[:password])
    @signup.save
    redirect_to("/signup_form")
  end


  def login_form
  end

  def login
    @login = User.find_by(email: params[:email], password: params[:password])
    if @login
      session[:user_id] = @login.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error = "何か間違っています"
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login_form")
  end

end
