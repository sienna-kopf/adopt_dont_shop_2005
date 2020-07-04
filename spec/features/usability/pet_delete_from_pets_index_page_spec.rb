require 'rails_helper'

RSpec.describe "Delete a pet from pet index page" do
  it "can click a link on the pet index page to delete the pet" do
    shelter = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)
    pet = Pet.create!(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU",
              name: "Frankie",
              description: "Used to belong to a professional rock climber. Loves bath time!",
              approximate_age: 7,
              sex: "male",
              adoptability: true,
              shelter: shelter)
    visit "/pets"
    expect(page).to have_content("Frankie")

    click_on "Delete #{pet.name}"

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Frankie")
  end
end
