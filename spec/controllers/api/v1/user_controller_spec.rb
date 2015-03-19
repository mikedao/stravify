require 'rails_helper'

RSpec.describe Api::V1::UserController, type: :controller do
  it "shows a users info via API" do
    user = User.create(id: 100,
                       first_name: "Mike",
                       ftp: 200,
                       time_ridden: 300,
                       distance_ridden: 400)
    get :show, format: :json, id: 100

    expect(response.status).to eq(200)
  end
end
