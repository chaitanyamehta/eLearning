FactoryBot.define do
  factory :teacher do
    name { 'Dr. Edward Gehringer' }
    phone_number { '919-999-9999' }
    address { 'NC State University' }
    discipline { Discipline.first || association(:discipline) }
    user_auth { UserAuth.create(email: 'efg@ncsu.edu', password: '12345', password_confirmation: '12345') }
    is_deleted { false }
  end
end