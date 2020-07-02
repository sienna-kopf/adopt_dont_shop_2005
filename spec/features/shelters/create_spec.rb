require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters" do
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

    visit '/shelters'

    expect(page).to_not have_content("Best Friends Animal Society")

    click_on "New Shelter"

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Best Friends Animal Society"
    fill_in :address, with: "2005 1100 East"
    fill_in :city, with: "Salt Lake City"
    fill_in :state, with: "Utah"
    fill_in :zip, with: "84106"

    click_button "Create Shelter"

    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Best Friends Animal Society")
  end
end
