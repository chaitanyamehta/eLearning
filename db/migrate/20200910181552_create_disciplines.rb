class CreateDisciplines < ActiveRecord::Migration[6.0]
  def change
    create_table :disciplines do |t|
      t.string :description

      t.timestamps
    end
    add_index :disciplines, :description, unique: true
  end
end
