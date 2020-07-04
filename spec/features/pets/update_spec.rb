require 'rails_helper'

RSpec.describe "update an existing pet" do
  it "can follow a link from the pet show page to update the pets information" do

    shelter = Shelter.create!(name: "Happy Homes for Unusual pets",
                              address: "345 Fun Court",
                              city: "Portland",
                              state: "Oregon",
                              zip: 88888)
    pet = Pet.create!(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU",
                      name: "Frankie",
                      description: "Used to belong to a professional rock climber. Loves bath time!",
                      approximate_age: 7,
                      sex: "male",
                      adoptability: true,
                      shelter: shelter)

    visit "/pets/#{pet.id}"
    expect(page).to_not have_content("Felicia")
    expect(page).to_not have_content("Sex: female")

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet.id}/edit")

    fill_in :name, with: "Felicia"
    fill_in :sex, with: "female"

    click_button "Update Pet"

    expect(page).to have_content("Felicia")
    expect(page).to have_content("Sex: female")
    expect(current_path).to eq("/pets/#{pet.id}")
  end
end
