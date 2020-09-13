class Teacher < ApplicationRecord
  belongs_to :discipline
  has_one :user_auth, as: :authenticable
  accepts_nested_attributes_for :user_auth, update_only: true
  has_many :sections

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
  end

  def self.active_teachers
    self.where(is_deleted: false)
  end  
end
