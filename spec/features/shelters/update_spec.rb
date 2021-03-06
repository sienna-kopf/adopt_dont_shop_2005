require 'rails_helper'

RSpec.describe "Update Shelter", type: :feature do
  before :each do
    @shelter_1 = Shelter.create(name: "Forever Homes",
                               address: "123 Rainbow Road",
                               city: "Walla Walla",
                               state: "Washington",
                               zip: 99362)
    @shelter_2 = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)
  end
  it "can edit a shelters info" do
    visit "/shelters/#{@shelter_2.id}"
    expect(page).to_not have_content("Golden Animal Shelter")

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_2.id}/edit")

    fill_in :name, with: "Golden Animal Shelter"

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_2.id}")
    expect(page).to have_content("Golden Animal Shelter")
    expect(page).to_not have_content("Foothills Animal Shelter")
    expect(page).to have_content("City: #{@shelter_2.city}")
  end

  it "can follow a link from shelter index to shelter update" do
    visit "/shelters"

    click_on "Update #{@shelter_1.name}"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end
end
