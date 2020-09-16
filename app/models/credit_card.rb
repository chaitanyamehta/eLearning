class CreditCard < ApplicationRecord
  belongs_to :student
  
  validates :name_on_card, presence: true
  validates :card_number, length: { is: 16 }
  validates :cvv, length: { is: 3 }, numericality: { greater_than: 0 }
  validate :expires_in_future

  def expires_in_future
    if expiration_date < Date.today.beginning_of_month
      errors.add(:expiration_date, "should be in future")
    end
  end
end
