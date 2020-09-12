class CreateUserAuths < ActiveRecord::Migration[6.0]
  def change
    create_table :user_auths do |t|
      t.string :email
      t.string :password_digest
      t.references :authenticable, polymorphic: true
      
      t.timestamps
    end
    add_index :user_auths, :email, unique: true
  end
end
