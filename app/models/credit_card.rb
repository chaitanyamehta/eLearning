class CreditCard < ApplicationRecord
  belongs_to :student
  
  validates :name_on_card, presence: true
  validates :card_number, length: { is: 16 }
  validates :cvv, length: { is: 3 }
end
