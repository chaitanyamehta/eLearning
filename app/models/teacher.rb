class Teacher < User
  belongs_to :discipline
  has_many :sections
  has_many :feedbacks, through: :sections

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
  end

  def self.active_teachers
    self.where(is_deleted: false)
  end  
end
