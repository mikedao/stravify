require "rails_helper"
require "spec_helper"

RSpec.describe DashboardController, type: :integration do
  it "hits dashboard controller" do
    user = User.create(first_name: "Mike", token: ENV['STRAVA_PERSONAL'])
    bikes = [{name: "Bike", distance: "100"}]
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(DashboardController).to receive(:sorted_bikes).and_return(bikes)
    @controller.instance_variable_set(:@bikes, bikes)

    visit dashboard_path

  end
end
