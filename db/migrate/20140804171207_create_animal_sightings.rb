class CreateAnimalSightings < ActiveRecord::Migration
  def change
    create_table :animal_sightings do |t|
      t.references :animal, index: true
      t.references :sighting, index: true

      t.timestamps
    end
  end
end
