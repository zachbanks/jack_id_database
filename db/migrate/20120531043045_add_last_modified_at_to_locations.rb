class AddLastModifiedAtToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :last_modified_at, :datetime
  end
end
