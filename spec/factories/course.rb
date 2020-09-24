
FactoryBot.define do
  factory :course do
    course_number { 'ECE 517' }
    name { 'Object Oriented Design' }
    discipline { build(:discipline) }
    area { 'Software Engineering' }
    price { 100 }
    is_deleted { false }
  end
end