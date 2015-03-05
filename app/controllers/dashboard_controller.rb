class DashboardController < ApplicationController
  def index
    @bikes = session[:bikes]
  end
end
