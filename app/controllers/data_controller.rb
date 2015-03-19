class DataController < ApplicationController
  def bikedata
    bike_distances = session[:bikes].map do |bike|
      (bike["distance"].to_i / 1000).round(0)
    end.sort

    render json: bike_distances
  end
end
