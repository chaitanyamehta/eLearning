class Student < User
  belongs_to :major, class_name: :Discipline, foreign_key: :major_id
  has_one :credit_card
  has_one :cart
  has_many :purchases
  has_many :feedbacks

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
  end

  def self.active_students
    self.where(is_deleted: false)
  end  
end
