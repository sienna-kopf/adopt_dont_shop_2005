class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def shelter_index
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets
  end
end
