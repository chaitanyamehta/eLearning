FactoryBot.define do
  factory :section do
    course { Course.first || association(:course) }
    teacher { Teacher.first || association(:teacher) }
  end
end