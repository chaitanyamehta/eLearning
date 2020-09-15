class Feedback < ApplicationRecord
  belongs_to :section
  belongs_to :student

  validates :description, presence: true
end
