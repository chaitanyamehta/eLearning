class UserAuth < ApplicationRecord
  has_secure_password
  belongs_to :authenticable, polymorphic: true

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A(.+)@(.+)\.(.+)\z/, message: "invalid"  }
end
