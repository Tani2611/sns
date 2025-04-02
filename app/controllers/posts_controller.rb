class PostsController < ApplicationController
  def index
    @posts = Post.all
    
  end

  def post_form
    if @current

    else
      flash[:notice] = "ログインしてください"
      redirect_to("/login_form")
    end
  end

  def post
    @new = Post.new(text: params[:text], user_id: @current.id)
    @new.save
    redirect_to("/")
  end

  def delete
    @delete = Post.find_by(id: params[:id])
    @delete.destroy
    redirect_to("/")
  end
end
