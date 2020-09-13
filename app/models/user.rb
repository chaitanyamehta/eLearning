class User < ApplicationRecord
  self.abstract_class = true
  has_one :user_auth, as: :authenticable
  accepts_nested_attributes_for :user_auth, update_only: true

  validates :name, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
end