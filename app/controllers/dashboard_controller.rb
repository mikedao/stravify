class DashboardController < ApplicationController
  def index
    @bikes = sorted_bikes
    @clubs = session[:clubs]
    @ftp   = session[:ftp]
    @member_since = session[:member_since][0..3]
    @activities   = activity.all
    update_user_data(current_user, activity)
  end

  private

  def activity
    @activity ||= Activity.new(
      StravaService.new(current_user.token).activities
    )
  end

  def update_user_data(user, activity)
    user.time_ridden     = activity.time_ridden
    user.distance_ridden = activity.distance_ridden
    user.save
  end

  def sorted_bikes
    session[:bikes].sort_by do |bike|
      bike["distance"]
    end
  end
end
