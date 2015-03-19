require "rails_helper"
RSpec.describe DashboardController, type: :controller do
  it "hits dashboard controller" do
    session[:bikes] = [{name: "Bike", distance: 1000}]
    session[:clubs] = []
    session[:ftp] = 200
    session[:member_since] = "2011"
    user = User.create(first_name: "Mike", token: ENV['STRAVA_PERSONAL'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)


    expect(response.status).to eq(200)


    get :index
  end
end
