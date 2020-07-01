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

    visit "/shelters"

    # expect(page).to have_content(shelter_1.name)
    expect(page).to have_content("#{shelter_1.name}")
    # expect(page).to have_content(shelter_2.name)
    expect(page).to have_content("#{shelter_2.name}")
  end
end
