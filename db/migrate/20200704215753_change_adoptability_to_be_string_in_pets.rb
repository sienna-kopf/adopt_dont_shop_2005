class ChangeAdoptabilityToBeStringInPets < ActiveRecord::Migration[5.1]
  def up
    change_column :pets, :adoptability, :string
  end

  def down
    change_column :pets, :adoptability, :text
  end
end
