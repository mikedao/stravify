class DashboardController < ApplicationController
  after_action :save_metrics_to_database
  def index
    @bikes = sorted_bikes
    @clubs = session[:clubs]
    @ftp = session[:ftp]
    @member_since = session[:member_since][0..3]
    @activities = Activity.all(current_user.token)
  end

  def save_metrics_to_database
    recent = @activities.select do |activity|
      activity.recent == true
    end

    current_user.time_ridden = recent.reduce(0) do |sum, activity|
      sum += activity.raw_time
    end

    current_user.distance_ridden = recent.reduce(0) do |sum, activity|
      sum+= activity.distance
    end
    current_user.save
  end

  private

  def sorted_bikes
    session[:bikes].sort_by do |bike|
      bike["distance"]
    end
  end
end
