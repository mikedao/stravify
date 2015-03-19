require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :controller do
  it "shows a users info via API" do
    User.create(id: 100,
                first_name: "Mike",
                ftp: 200,
                time_ridden: 300,
                distance_ridden: 400)
    get :show, format: :json, id: 100

    result = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(result["ftp"]).to eq(200)
    expect(result["time"]).to eq(300)
    expect(result["distance"]).to eq(400)
  end
end
