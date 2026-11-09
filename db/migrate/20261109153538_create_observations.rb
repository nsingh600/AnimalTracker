class CreateObservations < ActiveRecord::Migration[7.2]
  def change
    create_table :observations do |t|
      t.string :location_name
      t.float :latitude
      t.float :longitude
      t.datetime :observed_at
      t.references :species, null: false, foreign_key: true

      t.timestamps
    end
  end
end
