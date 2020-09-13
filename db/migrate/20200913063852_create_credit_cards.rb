class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :name_on_card
      t.integer :card_number
      t.date :expiration_date
      t.integer :cvv
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
