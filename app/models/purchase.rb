class Purchase < ApplicationRecord
  belongs_to :student
  belongs_to :section
  
  validates :section_id, uniqueness: { scope: :student_id }
  validate :section_is_not_deleted

  def section_is_not_deleted
    if section.is_deleted
      errors.add(:course, "#{section.course.course_number} is not available or no longer being taught by #{section.teacher.name}")
    end
=begin
    if section.course.is_deleted
      errors.add(:course, "#{section.course.course_number} has been deleted")
    elsif section.teacher.is_deleted
      errors.add(:course, "is no longer being taught by #{section.teacher.name}")
    end
=end
  end
end
