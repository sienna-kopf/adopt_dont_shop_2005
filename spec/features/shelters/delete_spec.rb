require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
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
  
  it "can use a link to delete a shelter from the shelters index page" do

    visit "/shelters"

    expect(page).to have_content(@shelter_2.name)

    click_on "Delete #{@shelter_2.name}"

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Foothills Animal Shelter")
  end
end
