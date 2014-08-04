class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|
      t.string :name

      t.timestamps
    end
  end
end
