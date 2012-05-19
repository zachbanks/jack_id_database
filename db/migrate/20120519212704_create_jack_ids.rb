class CreateJackIds < ActiveRecord::Migration
  def change
    create_table :jack_ids do |t|
      t.references :location
      t.string :label
      t.string :connections

      t.timestamps
    end
    add_index :jack_ids, :location_id
  end
end
