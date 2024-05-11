class Tutor < ApplicationRecord
  belongs_to :course

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :course_id, presence: true
end
