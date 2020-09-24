class Teacher < User
  belongs_to :discipline
  has_many :sections
  has_many :courses, through: :sections
  has_many :feedbacks, through: :sections

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
    sections.each { |s| s.mark_deleted }
  end

  def self.active_teachers
    self.where(is_deleted: false)
  end  
end
