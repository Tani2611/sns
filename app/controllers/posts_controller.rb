class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def post_form
    
  end

  def post
    @new = Post.new(text: params[:text], user_id: params[:id])
    @new.save
    redirect_to("/")
  end
end
