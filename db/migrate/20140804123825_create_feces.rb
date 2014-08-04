class CreateFeces < ActiveRecord::Migration
  def change
    create_table :feces do |t|
      t.string :mass
      t.string :color
      t.string :consistency
      t.string :preservation
      t.references :sighting, index: true

      t.timestamps
    end
  end
end
