class SpeciesHabitat < ApplicationRecord
  belongs_to :species
  belongs_to :habitat
end