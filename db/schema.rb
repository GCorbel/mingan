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

ActiveRecord::Schema.define(version: 20140605204545) do

  create_table "sightings", force: true do |t|
    t.date     "date"
    t.string   "region"
    t.string   "vessel"
    t.time     "time"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "sea_state"
    t.string   "cloud_cover"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
