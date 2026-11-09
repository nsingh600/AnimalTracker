class CreateSpecies < ActiveRecord::Migration[7.2]
  def change
    create_table :species do |t|
      t.string :name
      t.string :scientific_name
      t.string :diet
      t.string :image_url
      t.string :conservation_status
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
