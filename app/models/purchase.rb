class Purchase < ApplicationRecord
  belongs_to :student
  belongs_to :section
  
  validates :section_id, uniqueness: { scope: :student_id }
end
