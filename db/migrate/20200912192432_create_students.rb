class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.references :major, null: false, foreign_key: {to_table: :disciplines}
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
