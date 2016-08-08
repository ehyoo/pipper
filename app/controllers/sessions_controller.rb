class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, notice: 'Signed in successfully'
    else
      flash[:alert] = 'Invalid email or password.'
      redirect_to new_session_url 
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: 'Signed out sucessfully'
  end
end
