class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :section
  
  validate :course_is_already_in_cart
  #validate :course_is_already_purchased
  validate :section_is_not_deleted

  def course_is_already_in_cart
    if CartItem.joins(:section).find_by('cart_id': cart.id, 'sections.course_id': section.course_id)
      errors.add(:course, "already exists in cart")
    end
  end

  def course_is_already_purchased
    if Purchase.joins(section: :teacher).find_by('student_id': cart.student_id, 'sections.course_id': section.course_id, 'sections.is_deleted': false)
      errors.add(:course, "has already been purchased")
    end
  end

  def section_is_not_deleted
    if section.is_deleted
      errors.add(:course, "#{section.course.course_number} is not available or no longer being taught by #{section.teacher.name}")
    end
  end
end
