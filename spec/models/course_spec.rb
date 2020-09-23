require 'rails_helper'

RSpec.describe Course, type: :model do
  subject {
    described_class.new(course_number: "Anything",
                        name: "Anything",
                        area: "Anything",
                        price: "Anything")
  }


  it "is not valid without a course_number" do
    subject.course_number = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a area" do
    subject.area = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a price" do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with price less than 0" do
    subject.price <0
    expect(subject).to_not be_valid
  end
end
