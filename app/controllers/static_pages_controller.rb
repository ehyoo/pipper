class StaticPagesController < ApplicationController
  def index
    if current_user
      @user = current_user
      redirect_to "/users/#{current_user.id}"
    end
  end
end
