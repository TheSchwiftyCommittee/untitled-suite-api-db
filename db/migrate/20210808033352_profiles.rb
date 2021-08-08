class Profiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :user_id
  end
end
