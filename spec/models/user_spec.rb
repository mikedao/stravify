require "rails_helper"

RSpec.describe User, type: :model do
  it "provides api data" do
    user = User.create(first_name: "Mike",
                       ftp: 205,
                       time_ridden: 100,
                       distance_ridden: 200)

    expect(user.api_data[:ftp]).to eq(205)
    expect(user.api_data[:time]).to eq(100)
    expect(user.api_data[:distance]).to eq(200)
  end
end
