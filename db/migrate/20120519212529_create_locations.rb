class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :building
      t.string :room
      t.text :notes

      t.timestamps
    end
    add_index :locations, :building_id
  end
end
