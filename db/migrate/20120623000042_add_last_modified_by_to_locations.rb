class AddLastModifiedByToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :name_of_last_to_modify, :string
    add_column :locations, :email_of_last_to_modify, :string
  end
end
