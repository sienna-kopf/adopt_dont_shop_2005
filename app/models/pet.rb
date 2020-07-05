class Pet < ApplicationRecord
  validates_presence_of :image
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :approximate_age
  validates_presence_of :sex

  belongs_to :shelter
end
