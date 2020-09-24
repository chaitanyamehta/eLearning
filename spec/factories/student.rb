FactoryBot.define do
  factory :student do
    name { 'Student' }
    phone_number { '919-999-2222' }
    address { 'NC State University' }
    major { Discipline.first || association(:discipline) }
    user_auth { UserAuth.create(email: 'student_test@ncsu.edu', password: '12345', password_confirmation: '12345') }
    is_deleted { false }
  end
end