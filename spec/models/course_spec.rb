require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'Self Validations' do
    subject { build(:course) }

    it "is valid with all valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a course_number" do
      subject.course_number = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:course_number]).to include ("can't be blank")
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name]).to include ("can't be blank")
    end

    it "is not valid without a area" do
      subject.area = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:area]).to include ("can't be blank")
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include ('is not a number')
    end

    it "is not valid with price less than 0" do
      subject.price = -1
      expect(subject).to_not be_valid
      expect(subject.errors[:price]).to include ('must be greater than or equal to 0')
    end
  end

  it "is not valid with duplicate course number" do
    course_1 = FactoryBot.create(:course, course_number: '506')
    course_2 = FactoryBot.build(:course, course_number: '506')
    expect(course_2).to_not be_valid
    expect(course_2.errors[:course_number]).to include ('has already been taken')
  end

  it "active course doesn't contain deleted course" do
    course_1 = FactoryBot.create(:course, is_deleted: true)
    course_2 = FactoryBot.create(:course, course_number: '506')
    expect(Course.active_courses).to_not include (course_1)
  end

  it "active course doesn't contain active course" do
    course_1 = FactoryBot.create(:course)
    course_2 = FactoryBot.create(:course, course_number: '506')
    expect(Course.active_courses).to include (course_1)
  end

  it "active sections doesn't contain sections with deleted teacher" do
    section = FactoryBot.create(:section)
    course = section.course
    section.teacher.mark_deleted
    expect(course.active_sections).to_not include (section)
  end

  it "active sections contains sections with active teacher" do
    section = FactoryBot.create(:section)
    course = section.course
    expect(course.active_sections).to include (section)
  end
end
