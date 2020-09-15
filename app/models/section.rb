class Section < ApplicationRecord
  belongs_to :course
  belongs_to :teacher
  has_many :purchases
  has_many :feedbacks
  has_many :students, through: :purchases
end
