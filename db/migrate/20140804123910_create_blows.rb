class CreateBlows < ActiveRecord::Migration
  def change
    create_table :blows do |t|
      t.string :distance
      t.string :quality
      t.string :preservation
      t.string :behavior
      t.string :group_size
      t.text :comments
      t.references :sighting, index: true

      t.timestamps
    end
  end
end
