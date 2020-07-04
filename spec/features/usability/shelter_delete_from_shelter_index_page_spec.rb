require 'rails_helper'

RSpec.describe "Delete a shelter from shelter index page" do
  it "can use a link on shelter index page to delete each specific shelter" do
    shelter = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)
    visit "/shelters"
    expect(page).to have_content("Foothills Animal Shelter")


    click_on "Delete #{shelter.name}"

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Foothills Animal Shelter")
  end
end
