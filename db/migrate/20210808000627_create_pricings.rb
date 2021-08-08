class CreatePricings < ActiveRecord::Migration[6.0]
  def change
    create_table :pricings do |t|
      t.boolean :premium, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
