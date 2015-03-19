require 'rails_helper'

RSpec.describe DataController, :type => :controller do
  it "provides bike data" do
    session[:bikes] =[ { "name" => "Bike", "distance" => "100000" }]

    get :bikedata, format: :json
    result = JSON.parse(response.body)

    expect(result.first).to eq(100)
  end
end
