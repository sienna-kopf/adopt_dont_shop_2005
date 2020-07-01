require 'rails_helper'

RSpec.describe "Welcome page", type: :feature do
  it "can see welcome page" do

    visit "/"

    expect(page).to have_content("Adopt Rocks, Don't Shop")
  end
end
