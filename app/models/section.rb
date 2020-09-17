class Section < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :purchases
  has_many :feedbacks
  has_many :students, through: :purchases

  validates :course_id, uniqueness: { scope: :teacher_id }

  def is_deleted
    teacher.is_deleted or course.is_deleted
  end
end
