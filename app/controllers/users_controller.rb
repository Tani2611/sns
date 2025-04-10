class UsersController < ApplicationController
  def new
  end
  def create
    @signup = User.new(name: params[:name], email: params[:email], password: params[:password], image: "default_image.jpg")
    @signup.save
    flash[:notice] = "新規登録しました"
    redirect_to("/mypage/#{@signup.id}")
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
    @follows = Follow.all
    @follower_count = Follow.where(followed_id: @mypage.id).count
    @followed_count = Follow.where(follower_id: @mypage.id).count
    if @current
      @follow_check = Follow.find_by(follower_id: @mypage.id, followed_id: @current.id)
    end
    @user_posts = Post.where(user_id: @mypage.id)
  end

  def edit
    @mypage = User.find_by(id: params[:id])
  end

  def update
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
    redirect_to("/mypage/#{params[:id]}")
  end

  def delete
    @delete = User.find_by(id: params[:id])
    @delete.destroy
    redirect_to("/")
  end



end
