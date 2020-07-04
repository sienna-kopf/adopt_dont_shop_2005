require 'rails_helper'

RSpec.describe "Update a pet from pet index page" do
  it "can follow a link from pet index page to a form to update the pet" do
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

    click_on "Update #{pet.name}"

    expect(current_path).to eq("/pets/#{pet.id}/edit")
  end
end
