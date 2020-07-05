require 'rails_helper'

RSpec.describe "delete an existing pet" do
  it "can click a link from the pets show page to delete a pet" do

    shelter = Shelter.create!(name: "Happy Homes for Unusual pets",
                              address: "345 Fun Court",
                              city: "Portland",
                              state: "Oregon",
                              zip: 88888)
    pet = Pet.create!(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU",
                      name: "Maxwell",
                      description: "Brown and white ferret. Loves to climb around in its cage and would appreciate a home with space to play!",
                      approximate_age: 4,
                      sex: "male",
                      adoptability: "adoptable",
                      shelter: shelter)

    visit "/pets/#{pet.id}"

    click_on "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to_not have_content("Maxwell")
    expect(page).to_not have_content(pet.description)
  end
end
