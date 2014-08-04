class CreateCloudCovers < ActiveRecord::Migration
  def change
    create_table :cloud_covers do |t|
      t.string :name

      t.timestamps
    end
  end
end
