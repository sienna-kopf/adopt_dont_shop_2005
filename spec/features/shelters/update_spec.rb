require 'rails_helper'

RSpec.describe "Edit Shelter", type: :feature do
  it "can edit a shelters info" do
    shelter_1 = Shelter.create(name: "Forever Homes",
                               address: "123 Rainbow Road",
                               city: "Walla Walla",
                               state: "Washington",
                               zip: 99362)
    shelter_2 = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)

    visit "/shelters/#{shelter_2.id}"
    expect(page).to_not have_content("Golden Animal Shelter")

    click_on "Edit Shelter"

    expect(current_path).to eq("/shelters/#{shelter_2.id}/edit")

    fill_in :name, with: "Golden Animal Shelter"

    click_button "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_2.id}")
    expect(page).to have_content("Golden Animal Shelter")
    expect(page).to_not have_content("Foothills Animal Shelter")
    expect(page).to have_content("City: #{shelter_2.city}")
  end
end
