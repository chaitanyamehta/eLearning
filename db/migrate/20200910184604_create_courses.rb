class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_number
      t.string :name
      t.references :discipline, null: false, foreign_key: true
      t.string :area
      t.float :price
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
