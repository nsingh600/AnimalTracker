class CreateHabitats < ActiveRecord::Migration[7.2]
  def change
    create_table :habitats do |t|
      t.string :climate
      t.string :region_name

      t.timestamps
    end
  end
end
