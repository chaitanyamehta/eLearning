class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :student, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
