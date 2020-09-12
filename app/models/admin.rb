class Admin < ApplicationRecord
  has_one :user_auth, as: :authenticable
  accepts_nested_attributes_for :user_auth, update_only: true
  
end
