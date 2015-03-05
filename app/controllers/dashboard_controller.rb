class DashboardController < ApplicationController
  def index
    @bikes = session[:bikes]
    @clubs = session[:clubs]
    @ftp = session[:ftp]
    @member_since = session[:member_since][0..3]
  end
end
