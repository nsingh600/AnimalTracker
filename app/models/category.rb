class Category < ApplicationRecord
  has_many :species, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
