class AddAdoptabilityToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adoptability, :boolean
  end
end
