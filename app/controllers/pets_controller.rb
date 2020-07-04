class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def shelter_index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end
end
