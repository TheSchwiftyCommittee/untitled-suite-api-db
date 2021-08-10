class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :priority
      t.boolean :completed, default: false
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
