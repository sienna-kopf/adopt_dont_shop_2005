require 'rails_helper'

RSpec.describe "Navigate from shelter index to shelter Update" do
  it "can follow a link from shelter index to shelter update" do
    shelter = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)
    visit "/shelters"

    click_on "Update #{shelter.name}"

    expect(current_path).to eq("/shelters/#{shelter.id}/edit")
  end
end
