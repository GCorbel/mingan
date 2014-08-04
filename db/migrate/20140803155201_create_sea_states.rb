class CreateSeaStates < ActiveRecord::Migration
  def change
    create_table :sea_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
