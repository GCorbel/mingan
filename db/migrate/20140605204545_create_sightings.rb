class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.date :date
      t.references :region, index: true
      t.references :vessel, index: true
      t.time :time
      t.string :latitude
      t.string :longitude
      t.references :sea_state, index: true
      t.references :cloud_cover, index: true
      t.string :wind_speed
      t.string :wind_direction
      t.string :visibility
      t.string :precipitation
      t.text :comments
      t.string :staff
      t.time :start_time
      t.string :start_place
      t.time :end_time
      t.string :end_place
      t.text :comments2
      t.references :mode, index: true
      t.references :species, index: true

      t.timestamps
    end
  end
end
