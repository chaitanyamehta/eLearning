class Course < ApplicationRecord
  belongs_to :discipline
  has_many :sections
  has_many :teachers, through: :sections
  has_many :purchases, through: :sections

  validates :course_number, presence: true
  validates :name, presence: true
  validates :area, presence: true

  def mark_deleted
    update_attribute(:is_deleted, true)
  end

  def self.active_courses
    self.where(is_deleted: false)
  end
end
