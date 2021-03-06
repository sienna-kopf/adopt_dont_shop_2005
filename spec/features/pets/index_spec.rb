require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets" do
    shelter = Shelter.create!(name: "Forever Homes",
                              address: "123 Rainbow Road",
                              city: "Walla Walla",
                              state: "Washington",
                              zip: 99362)
    pet_1 = Pet.create!(image: "https://www.catological.com/wp-content/uploads/2020/03/CatSleepingCurled-1024x730.jpeg",
                        name: "Bagel",
                        description: "Small tabby cat. Loves to cuddle!",
                        approximate_age: 3,
                        sex: "Female",
                        adoptability: "pending adoption",
                        shelter: shelter)
    pet_2 = shelter.pets.create!(image: "https://image.shutterstock.com/image-photo/kitty-cat-munchkin-fluffy-animal-260nw-1151252666.jpg",
                                 name: "Mackenzie",
                                 description: "Spunky personality. Loves to play and would appreciate a family with lots of energy!",
                                 approximate_age: 1,
                                 sex: "Female",
                                 adoptability: "adoptable")

    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_xpath("//img[@src='https://www.catological.com/wp-content/uploads/2020/03/CatSleepingCurled-1024x730.jpeg']")
    expect(page).to have_content("Approximate Age: #{pet_1.approximate_age}")
    expect(page).to have_content("Sex: #{pet_1.sex}")
  end
end
