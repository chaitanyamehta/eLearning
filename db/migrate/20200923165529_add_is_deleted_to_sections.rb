class AddIsDeletedToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :is_deleted, :boolean, :default => false
  end
end
