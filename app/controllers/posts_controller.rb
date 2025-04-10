class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
    @follows = Follow.all
  end

  def new
    if @current

    else
      flash[:notice] = "ログインしてください"
      redirect_to("/login_form")
    end
  end

  def create
    @new = Post.new(text: params[:text], user_id: @current.id)
    @new.save
    redirect_to("/")
  end

  def search
    @searchs = Post.where("text LIKE (?)", "%#{params[:search]}%")
  end

  def edit
    @user_post = Post.find_by(id: params[:id])
  end

  def update
    @user_post = Post.find_by(id: params[:id])
    @user_post.text = params[:text]
    @user_post.save

    flash[:notice] = "編集完了"
    redirect_to("/")
  end

  def delete
    @delete = Post.find_by(id: params[:id])
    @delete.destroy
    redirect_to("/")
  end
end
