class CreateAdminDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :admin_directors do |t|

      t.timestamps
    end
  end
end
