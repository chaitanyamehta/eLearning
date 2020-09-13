class Student < ApplicationRecord
  belongs_to :major, class_name: :Discipline, foreign_key: :major_id
  has_one :user_auth, as: :authenticable
  accepts_nested_attributes_for :user_auth, update_only: true
  has_one :credit_card
  has_one :cart

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
  end

  def self.active_students
    self.where(is_deleted: false)
  end  
end
