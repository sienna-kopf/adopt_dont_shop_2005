require 'rails_helper'

RSpec.describe "Welcome page", type: :feature do
  it "can see welcome page" do

    visit "/"

    expect(page).to have_content("Adopt. Don't Shop.")
  end

  it "can link to shelter index page" do
    visit '/'

    click_on "Shelters"

    expect(current_path).to eq("/shelters")
  end

  it "can link to pets index page" do
    visit '/'

    click_on "Pets"

    expect(current_path).to eq("/pets")
  end
end
