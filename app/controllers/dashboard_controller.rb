class DashboardController < ApplicationController
  def index
    @bikes = sorted_bikes
    @clubs = session[:clubs]
    @ftp = session[:ftp]
    @member_since = session[:member_since][0..3]
    @activities = Activity.all(current_user.token)
  end

  private

  def sorted_bikes
    session[:bikes].sort_by do |bike|
      bike["distance"]
    end
  end
end
