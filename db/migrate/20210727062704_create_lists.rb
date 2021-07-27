class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.boolean :completed

      t.timestamps
    end
  end
end
