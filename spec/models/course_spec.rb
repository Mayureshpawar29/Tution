require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { create(:course) }

  it 'is valid with valid attributes' do
    expect(course).to be_valid
  end

  it 'is not valid without a title' do
    course.title = nil
    expect(course).not_to be_valid
  end

  it 'is not valid with a non-unique title' do
    course1 = create(:course, title: 'Test Title')
    course2 = build(:course, title: 'Test Title')
    expect(course2).not_to be_valid
  end

  it 'is not valid with a description longer than 1000 characters' do
    course.description = 'a' * 1001
    expect(course).not_to be_valid
  end

  it 'is valid when the start date is less than the end date' do
    course.start_date = Date.today
    course.end_date = Date.today + 1.day
    expect(course).to be_valid
  end

  it 'is not valid when the start date is greater than the end date' do
    course.start_date = Date.today + 1.day
    course.end_date = Date.today
    expect(course).not_to be_valid
  end
end
