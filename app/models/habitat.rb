class Habitat < ApplicationRecord
  has_many :species_habitats, dependent: :destroy
  has_many :species, through: :species_habitats
  validates :region_name, presence: true
end