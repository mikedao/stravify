class DataController < ApplicationController
  def bikedata
    bike_distances = session[:bikes].map do |bike|
      bike["distance"]
    end.sort

    render :json => bike_distances
  end

end
