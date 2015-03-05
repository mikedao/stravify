class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth)
    if @user
      session[:user_id] = @user.id
      session[:bikes] = bikes
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

  def bikes
    auth.extra.raw_info.bikes
  end
end
