class FollowsController < ApplicationController
  
  def in
    @user_id = User.find_by(id: params[:id])
    @in = Follow.new(follower_id: @user_id.id, followed_id: @current.id)
    @in.save
    redirect_to("/mypage/#{@user_id.id}")
  end

  def out
    @user_id = User.find_by(id: params[:id])
    @out = Follow.find_by(follower_id: @user_id.id, followed_id: @current.id)
    @out.destroy
    redirect_to("/mypage/#{@user_id.id}")
  end

  def follower
    @user = User.find_by(id: params[:id])
    @follows = Follow.where(followed_id: @user.id)
  end
  
  def followed
    @user = User.find_by(id: params[:id])
    @follows = Follow.where(follower_id: @user.id)
  end

end
