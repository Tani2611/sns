class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new_form
    
  end

  def new
    @new = Post.new(text: params[:text])
    @new.save
    redirect_to("/")
  end
end
