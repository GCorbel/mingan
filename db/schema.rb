# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140804200605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_sightings", force: true do |t|
    t.integer  "animal_id"
    t.integer  "sighting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animal_sightings", ["animal_id"], name: "index_animal_sightings_on_animal_id", using: :btree
  add_index "animal_sightings", ["sighting_id"], name: "index_animal_sightings_on_sighting_id", using: :btree

  create_table "animals", force: true do |t|
    t.string   "name"
    t.integer  "biopsy_id"
    t.integer  "fece_id"
    t.integer  "blow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "animals", ["biopsy_id"], name: "index_animals_on_biopsy_id", using: :btree
  add_index "animals", ["blow_id"], name: "index_animals_on_blow_id", using: :btree
  add_index "animals", ["fece_id"], name: "index_animals_on_fece_id", using: :btree

  create_table "biopsies", force: true do |t|
    t.string   "tissue"
    t.string   "preservation"
    t.string   "purpose"
    t.string   "reaction"
    t.text     "comments"
    t.string   "sex"
    t.integer  "sighting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "biopsies", ["sighting_id"], name: "index_biopsies_on_sighting_id", using: :btree

  create_table "blows", force: true do |t|
    t.string   "distance"
    t.string   "quality"
    t.string   "preservation"
    t.string   "behavior"
    t.string   "group_size"
    t.text     "comments"
    t.integer  "sighting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blows", ["sighting_id"], name: "index_blows_on_sighting_id", using: :btree

  create_table "cloud_covers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feces", force: true do |t|
    t.string   "mass"
    t.string   "color"
    t.string   "consistency"
    t.string   "preservation"
    t.integer  "sighting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feces", ["sighting_id"], name: "index_feces_on_sighting_id", using: :btree

  create_table "modes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sea_states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sightings", force: true do |t|
    t.date     "date"
    t.integer  "region_id"
    t.integer  "vessel_id"
    t.time     "time"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "sea_state_id"
    t.integer  "cloud_cover_id"
    t.string   "wind_speed"
    t.string   "wind_direction"
    t.string   "visibility"
    t.string   "precipitation"
    t.text     "comments"
    t.string   "staff"
    t.time     "start_time"
    t.string   "start_place"
    t.time     "end_time"
    t.string   "end_place"
    t.text     "comments2"
    t.integer  "mode_id"
    t.integer  "species_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sightings", ["cloud_cover_id"], name: "index_sightings_on_cloud_cover_id", using: :btree
  add_index "sightings", ["mode_id"], name: "index_sightings_on_mode_id", using: :btree
  add_index "sightings", ["region_id"], name: "index_sightings_on_region_id", using: :btree
  add_index "sightings", ["sea_state_id"], name: "index_sightings_on_sea_state_id", using: :btree
  add_index "sightings", ["species_id"], name: "index_sightings_on_species_id", using: :btree
  add_index "sightings", ["vessel_id"], name: "index_sightings_on_vessel_id", using: :btree

  create_table "species", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vessels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
