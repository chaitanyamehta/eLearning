class Course < ApplicationRecord
  belongs_to :discipline

  def mark_deleted
    update_attribute(:is_deleted, true)
  end

  def self.active_courses
    self.where(is_deleted: false)
  end
end
