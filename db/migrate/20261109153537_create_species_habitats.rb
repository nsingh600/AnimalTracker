class CreateSpeciesHabitats < ActiveRecord::Migration[7.2]
  def change
    create_table :species_habitats do |t|
      t.references :species, null: false, foreign_key: true
      t.references :habitat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
