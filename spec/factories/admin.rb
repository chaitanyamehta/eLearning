FactoryBot.define do
  factory :admin do
    name { 'Administrator' }
    phone_number { '919-999-1111' }
    address { 'NC State University' }
    user_auth { UserAuth.create(email: 'admin_test@ncsu.edu', password: '12345', password_confirmation: '12345') }
  end
end