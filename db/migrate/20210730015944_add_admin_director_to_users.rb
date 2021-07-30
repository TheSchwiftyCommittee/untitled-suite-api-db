class AddAdminDirectorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_director, :boolean, default: false
  end
end
