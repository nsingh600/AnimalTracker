class Observation < ApplicationRecord
  belongs_to :species

  validates :location_name, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
