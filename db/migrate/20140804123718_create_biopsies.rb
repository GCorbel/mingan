class CreateBiopsies < ActiveRecord::Migration
  def change
    create_table :biopsies do |t|
      t.string :tissue
      t.string :preservation
      t.string :purpose
      t.string :reaction
      t.text :comments
      t.string :sex
      t.references :sighting, index: true

      t.timestamps
    end
  end
end
