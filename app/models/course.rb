class Course < ApplicationRecord
  has_many :tutors

  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates_comparison_of :end_date, greater_than: :start_date
end
