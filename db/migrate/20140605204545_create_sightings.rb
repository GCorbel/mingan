class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.date :date
      t.string :region
      t.string :vessel
      t.time :time
      t.string :latitude
      t.string :longitude
      t.string :sea_state
      t.string :cloud_cover
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

      t.timestamps
    end
  end
end
