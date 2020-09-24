class Student < User
  belongs_to :major, class_name: :Discipline, foreign_key: :major_id
  has_one :credit_card
  has_one :cart
  has_many :purchases
  has_many :sections, through: :purchases
  has_many :courses, through: :sections
  has_many :feedbacks

  after_create do |s|
    Cart.create(student_id: s.id)
  end

  def mark_deleted
    update_attribute(:is_deleted, true)
    user_auth.destroy
    cart.destroy
  end

  def self.active_students
    self.where(is_deleted: false)
  end  

  def enrolled_courses
    Course.joins(sections: [{purchases: :student}]).where('purchases.student_id': id, 'sections.is_deleted': false)
  end
end
