class RemoveUsernameFromAdminsAndAddEmailAndName < ActiveRecord::Migration
  def change
    remove_column :admins, :username
    add_column :admins, :email, :string
    add_column :admins, :name, :string
  end
end
