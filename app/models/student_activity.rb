class StudentActivity < ApplicationRecord
  belongs_to :student
  belongs_to :activity

  validates :student_id, presence: true
  validates :course_id, presence: true
end
