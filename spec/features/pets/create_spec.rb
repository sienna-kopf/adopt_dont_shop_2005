require 'rails_helper'

RSpec.describe "create a new pet" do
  describe 'when the user visits the shelter pets index page' do
    it "can follow a link to create a new pet" do

      shelter = Shelter.create!(name: "Happy Homes for Unusual pets",
                               address: "345 Fun Court",
                               city: "Portland",
                               state: "Oregon",
                               zip: 88888)

      visit "/shelters/#{shelter.id}/pets"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter.id}/pets/new")

      fill_in :image, with: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7udIOy8BXHLWl3uzUyIYubCyvVgRlArZSJw&usqp=CAU"
      fill_in :name, with: "Piper"
      fill_in :description, with: "Green Pit Viper, loves to 'cuddle' around hands or necks. Great pet for a chill owner!"
      fill_in :approximate_age, with: 2
      fill_in :sex, with: "female"

      click_button "Create Pet"

      new_pet = Pet.last

      expect(current_path).to eq("/shelters/#{shelter.id}/pets")

      expect(page).to have_xpath("//img[@src='https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7udIOy8BXHLWl3uzUyIYubCyvVgRlArZSJw&usqp=CAU']")
      expect(page).to have_content(new_pet.name)
      expect(page).to have_content("Approximate Age: #{new_pet.approximate_age}")
      expect(page).to have_content("Sex: #{new_pet.sex}")
      expect(new_pet.adoptability).to eq("adoptable")
    end
  end
end
