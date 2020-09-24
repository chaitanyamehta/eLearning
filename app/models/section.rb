class Section < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :purchases
  has_many :feedbacks
  has_many :students, through: :purchases

  validates :course_id, presence: true #, uniqueness: { scope: :teacher_id }

  def mark_deleted
    update_attribute(:is_deleted, true)
  end
end
