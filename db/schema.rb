# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_11_09_153538) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitats", force: :cascade do |t|
    t.string "climate"
    t.string "region_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string "location_name"
    t.float "latitude"
    t.float "longitude"
    t.datetime "observed_at"
    t.integer "species_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_observations_on_species_id"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.string "scientific_name"
    t.string "diet"
    t.string "image_url"
    t.string "conservation_status"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_species_on_category_id"
  end

  create_table "species_habitats", force: :cascade do |t|
    t.integer "species_id", null: false
    t.integer "habitat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habitat_id"], name: "index_species_habitats_on_habitat_id"
    t.index ["species_id"], name: "index_species_habitats_on_species_id"
  end

  add_foreign_key "observations", "species"
  add_foreign_key "species", "categories"
  add_foreign_key "species_habitats", "habitats"
  add_foreign_key "species_habitats", "species"
end
