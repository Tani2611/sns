class UsersController < ApplicationController
  def signup_form
    @users = User.all
  end
  def signup
    @signup = User.new(name: params[:name], email: params[:email], password: params[:password], image: "default_image.jpg")
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

  def mypage
    @mypage = User.find_by(id: params[:id])
  end
  def mypage_edit
    @mypage = User.find_by(id: params[:id])
  end
  def mypage_update
    @user = User.find_by(id: params[:id])

    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if params[:image]
      @user.image = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}",image.read)
    end
    @user.save
    redirect_to("/")
  end

  def delete
    @delete = User.find_by(id: params[:id])
    @delete.destroy
    redirect_to("/")
  end

end
