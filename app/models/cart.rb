class Cart < ApplicationRecord
  belongs_to :student
  has_many: cart_items
end
