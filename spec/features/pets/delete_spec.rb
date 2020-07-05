require 'rails_helper'

RSpec.describe "Delete a pet" do
  before :each do
    @shelter = Shelter.create(name: "Foothills Animal Shelter",
                               address: "580 McIntyre St.",
                               city: "Golden",
                               state: "Colorado",
                               zip: 80401)
    @pet = Pet.create!(image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU",
              name: "Frankie",
              description: "Used to belong to a professional rock climber. Loves bath time!",
              approximate_age: 7,
              sex: "male",
              adoptability: "adoptable",
              shelter: @shelter)
  end

  it "can use a link to delete an existing pet from the pets show page" do
    visit "/pets/#{@pet.id}"
    expect(page).to have_content(@pet.name)
    expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")


    click_on "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to_not have_content("Frankie")
    expect(page).to_not have_content(@pet.description)
    expect(page).to_not have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")
  end

  it "can click a link on the pet index page to delete the pet" do
    visit "/pets"
    expect(page).to have_content("Frankie")
    expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")

    click_on "Delete #{@pet.name}"

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Frankie")
    expect(page).to_not have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")
  end

  it "can click a link on the shelters Pets index page to delete the pet" do
    visit "/shelters/#{@shelter.id}/pets"
    expect(page).to have_content("Frankie")
    expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")

    click_on "Delete #{@pet.name}"

    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Frankie")
    expect(page).to_not have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTUFogxQ6ah2P7oByKgOxr9F8fMZ7lPuQCVlw&usqp=CAU']")
  end
end
