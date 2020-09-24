class Section < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :purchases
  has_many :feedbacks
  has_many :students, through: :purchases

  validate :course_already_enrolled

  def mark_deleted
    update_attribute(:is_deleted, true)
  end

  def course_already_enrolled
    if Section.joins(:teacher).find_by('teacher_id': teacher.id, 'is_deleted': false)
      errors.add(:course, "has already been enrolled")
    end
  end
end
