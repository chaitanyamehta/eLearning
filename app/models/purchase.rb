class Purchase < ApplicationRecord
  belongs_to :student
  belongs_to :section
  
  validates :section_id, uniqueness: { scope: :student_id }
  validate :course_is_not_deleted

  def course_is_not_deleted
    if section.course.is_deleted
      errors.add(:course, "has been deleted")
    elsif section.teacher.is_deleted
      errors.add(:course, "is not being taught by teacher")
    end
  end
end
