class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth(auth)
    if @user
      session[:user_id] = @user.id
      session[:bikes] = bikes
      session[:clubs] = clubs
      session[:ftp] = ftp
      session[:member_since] = join_date
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

  def bikes
    auth.extra.raw_info.bikes
  end

  def clubs
    auth.extra.raw_info.clubs
  end

  def ftp
    auth.extra.raw_info.ftp
  end

  def join_date
    auth.extra.raw_info.created_at
  end

end
