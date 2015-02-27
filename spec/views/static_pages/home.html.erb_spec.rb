require 'rails_helper'

RSpec.describe "static_pages/home.html.erb", :type => :view do
  include Capybara::DSL

  it "has welcome text" do
    visit root_path

    expect(page).to have_content("Welcome to Stravify")
  end
end
