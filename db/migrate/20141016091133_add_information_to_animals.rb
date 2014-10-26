class AddInformationToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :pics_id, :string
    add_column :animals, :field_id, :string
    add_column :animals, :number, :integer
    add_column :animals, :position_in_group, :string
    add_column :animals, :cow_calf, :string
    add_column :animals, :first_sight, :string
    add_column :animals, :time, :datetime
    add_column :animals, :species_id, :integer
    add_column :animals, :vessel_id, :integer
    add_index :animals, :species_id
    add_index :animals, :vessel_id
  end
end
