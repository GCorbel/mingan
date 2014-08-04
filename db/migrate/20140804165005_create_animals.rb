class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.references :biopsy, index: true
      t.references :fece, index: true
      t.references :blow, index: true

      t.timestamps
    end
  end
end
