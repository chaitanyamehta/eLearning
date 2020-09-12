class UserAuth < ApplicationRecord
  has_secure_password
  belongs_to :authenticable, polymorphic: true
  validates :email, presence: true, uniqueness: true
end
