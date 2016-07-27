class FollowsController < ApplicationController
  def create
    follow = Follow.new(follower_id: current_user.id, followee_id: params[:followee_id])
    respond_to do |format|
      if follow.save
        format.html { redirect_to User.find(params[:followee_id]), notice: 'You have successfully followed this user!' }
      else
        format.html { redirect_to User.find(params[:followee_id]), notice: 'There was a problem following this user!' }
      end
    end
  end

  def destroy

  end  
end
