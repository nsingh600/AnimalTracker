class Species < ApplicationRecord
  belongs_to :category
  has_many :observations, dependent: :destroy
  has_many :species_habitats, dependent: :destroy
  has_many :habitats, through: :species_habitats

  validates :name, presence: true, uniqueness: true
  validates :scientific_name, presence: true
end
