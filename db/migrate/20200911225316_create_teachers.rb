class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.references :discipline, null: false, foreign_key: true
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
