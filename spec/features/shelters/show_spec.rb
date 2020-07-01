require 'rails_helper'
RSpec.describe "shelters show info page", type: :feature do
  it "can see shelter information" do
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

    visit "/shelters/#{shelter_1.id}"

    # # expect(page).to have_content(shelter_1.name)
    # expect(page).to have_content("#{shelter_1.name}")
    # # expect(page).to have_content(shelter_1.address)
    # expect(page).to have_content("#{shelter_1.address}")
    # # expect(page).to have_content(shelter_1.city)
    # expect(page).to have_content("#{shelter_1.city}")
    # # expect(page).to have_content(shelter_1.state)
    # expect(page).to have_content("#{shelter_1.state}")
    # # expect(page).to have_content(shelter_1.zip)
    # expect(page).to have_content("#{shelter_1.zip}")
    # # expect(page).to have_content(shelter_2.name)
    # expect(page).to have_content("#{shelter_2.name}")
    # # expect(page).to have_content(shelter_2.address)
    # expect(page).to have_content("#{shelter_2.address}")
    # # expect(page).to have_content(shelter_2.city)
    # expect(page).to have_content("#{shelter_2.city}")
    # # expect(page).to have_content(shelter_2.state)
    # expect(page).to have_content("#{shelter_2.state}")
    # # expect(page).to have_content(shelter_2.zip)
    # expect(page).to have_content("#{shelter_2.zip}")
  end
end
