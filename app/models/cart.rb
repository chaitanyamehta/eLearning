class Cart < ApplicationRecord
  belongs_to :student
  has_many :cart_items, dependent: :destroy
  has_many :sections, through: :cart_items
  has_many :courses, through: :sections
end
