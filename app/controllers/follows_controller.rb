class FollowsController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:follow_type] == 'follower'
      render :followers
    elsif params[:follow_type] == 'followee'
      render :followees
    else
      puts 'ayy lmao'
      redirect_to @user
    end
  end

  def create
    if current_user.follow(params[:followee_id])
      notice = 'You have successfully followed this user!'
    else
      notice = 'Something went wrong while following this user!'
    end
    redirect_to User.find(params[:followee_id]), notice: notice
  end

  def destroy
    # we have the followee_id here
    follow = Follow.where(user_id: current_user.id, followee_id: params[:followee_id]).first
    unless follow == nil
      Follow.destroy(follow.id)
      redirect_to current_user, notice: 'You have successfully unfollowed this user!'
    end
  end  
end