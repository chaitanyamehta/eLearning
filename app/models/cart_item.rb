class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :section
  
  validate :course_is_already_in_cart
  validate :course_is_already_purchased

  def course_is_already_in_cart
    if CartItem.joins(:section).find_by('sections.course_id': section.course_id)
      errors.add(:course, "already exists in cart")
    end
  end

  def course_is_already_purchased
    if Purchase.joins(:section).find_by('student_id': cart.student_id, 'sections.course_id': section.course_id)
      errors.add(:course, "has already been purchased")
    end
  end
end
