require 'rails_helper'

RSpec.describe "pets show page" do
  it "can display the info about a specific pet" do
    shelter = Shelter.create!(name: "Hopeful Homes",
                             address: "345 Fun Ct",
                             city: "Portland",
                             state: "Oregon",
                             zip: 88888)
    pet_1 = Pet.create!(image: "https://www.catological.com/wp-content/uploads/2020/03/CatSleepingCurled-1024x730.jpeg",
                       name: "Bagel",
                       description: "Small tabby. Very cuddly. Would berry much love a forever home <3",
                       approximate_age: 3,
                       sex: "Female",
                       adoptability: "not adoptable",
                       shelter: shelter)
    pet_2 = shelter.pets.create!(image: "https://image.shutterstock.com/image-photo/kitty-cat-munchkin-fluffy-animal-260nw-1151252666.jpg",
                       name: "Mackenzie",
                       description: "Spunky personality. Loves to play with toys. Take me home today!",
                       approximate_age: 1,
                       sex: "Female",
                       adoptability: "adoptable")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_xpath("//img[@src='https://www.catological.com/wp-content/uploads/2020/03/CatSleepingCurled-1024x730.jpeg']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content("Adoption Status: #{pet_1.adoptability}")
  end
end
